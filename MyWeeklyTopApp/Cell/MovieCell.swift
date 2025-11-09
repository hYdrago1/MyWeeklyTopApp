import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var posterPhoto: UIImageView!
    
    private var currentImageURL: URL?
    private let networkManager = MovieService.shared
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
            posterPhoto.layer.cornerRadius = 8
            posterPhoto.clipsToBounds = true
            posterPhoto.contentMode = .scaleAspectFill
        }
    
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        rateLabel.text = "★ \(movie.voteAverage) • \(movie.overview)"
        loadImage(from: movie.posterURL)
    }
    private func loadImage(from url: URL?) {
        guard let url = url else {
            posterPhoto.image = UIImage(systemName: "film")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
            guard let self, let data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async {
                self.posterPhoto.image = image
            }
        }.resume()
    }
}
