# SkinDetect

A skin disease classification service for mobile devices using a convolutional neural network backend.

Supported classifications:

- Actinic keratoses
- Basal cell carcinoma
- Benign keratosis
- Dermatofibroma
- Melanocytic nevi
- Melanoma
- Vascular lesions

![Screenshots](https://user-images.githubusercontent.com/25379378/68987982-120d7b00-07e5-11ea-942d-3ec0cbd8fe4c.png)

[View Demo](https://github.com/shamod/skindetect/raw/develop/demo.mp4)

This model uses a Flask server to provide user authentication and perform the image classification.
https://github.com/shamod/skindetect-server

## Install dependencies:

```bash
flutter pub get
```

## Run:

```bash
flutter run
```

## Model accuracy

![Confusion matrix](https://user-images.githubusercontent.com/25379378/69001985-be5e6880-089c-11ea-8fbe-82fb51a46ff6.png)

## Methods

Our model uses the HAM10000 dataset from harvard University, it includes a large collection of multi-source dermatoscopic images of pigmented lesions for classifications. Our model framework is built on PyTorch using the Fast.Ai library. We use transfer learning with the ResNet50 architecture base before adding the HAM 10,000 images on top.

## Credits

This work was completed by [Shamod Lacoul](https://www.linkedin.com/in/shamod/), [Craig Burnett](https://www.linkedin.com/in/craig-burnett-91274b38), and [Ryan Bell](https://www.linkedin.com/in/iryanbell/).
