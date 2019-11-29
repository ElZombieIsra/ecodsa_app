import 'package:flutter/material.dart';

import '../components/appBar.dart';
import '../globals.dart' as globals;
import '../style.dart' as Style;

class EcodsaPrivacyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
          children: <Widget>[
            CustomAppBar(),
            globals.separator(),
            Text(
              "Aviso de privacidad",
              style: Style.primaryText(fontSize: 20),
            ),
            globals.separator(height: 20.0),
            Text(
              """
              Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sed tincidunt dui. Nam tempor nibh at massa ultrices iaculis. Proin commodo ultrices rutrum. Duis ut dictum velit. Fusce purus lacus, accumsan in nulla non, mattis lacinia nunc. Nam elementum vitae velit consequat tempor. Morbi fermentum velit lorem, eget porttitor leo cursus in. Praesent semper semper libero. Etiam lobortis sem nec nibh elementum tempus. Sed mollis nibh pretium sapien tempor rutrum. Phasellus vehicula eu nunc non viverra.

Integer interdum augue arcu, ac porta diam aliquam vitae. Aliquam sodales lacus convallis, cursus lacus quis, faucibus tellus. Donec mattis nisi purus, id fringilla neque consectetur vitae. Donec et orci eros. Vestibulum hendrerit eros quam, a consequat risus facilisis in. Nullam sit amet nisi nunc. Ut consectetur ut tellus eget commodo. Mauris non arcu vitae ex suscipit aliquam vitae consequat nunc. Nullam lorem justo, tempus ac porta sed, ullamcorper nec augue. Phasellus suscipit, justo faucibus interdum malesuada, justo velit consectetur justo, eget hendrerit nunc felis sit amet metus. Etiam maximus nunc nec est ullamcorper, at condimentum lectus venenatis. Integer viverra at orci id imperdiet. Nam placerat felis a arcu facilisis elementum. Donec faucibus quis arcu non tempor. Proin blandit posuere facilisis. Praesent vel leo posuere, gravida orci sed, commodo nibh.

Integer ac est ipsum. Quisque nec augue ut orci lobortis egestas. Pellentesque et varius eros. Vivamus arcu risus, consequat eget nibh quis, bibendum malesuada purus. Pellentesque in turpis id tellus egestas imperdiet. Nulla a laoreet eros. Nunc purus elit, accumsan lacinia viverra at, commodo sit amet nibh. Proin volutpat ultricies dolor, nec sagittis leo pulvinar non. Duis sollicitudin, arcu id dictum egestas, augue diam sagittis nunc, quis pretium tellus ligula eu diam. Pellentesque lectus est, faucibus et mattis vel, auctor sit amet tellus.

Nunc congue erat quis arcu vulputate, sed euismod elit dapibus. Nulla semper elit justo, at vehicula diam tincidunt a. Etiam sit amet quam sit amet orci cursus volutpat. Aliquam faucibus ac sapien quis mollis. Mauris ut nisl mollis, posuere ipsum at, aliquet nulla. Suspendisse interdum pellentesque arcu quis finibus. Phasellus viverra ligula vitae consectetur convallis. Pellentesque enim leo, tempor sit amet mollis cursus, luctus sed ante. Integer pretium odio non tortor tincidunt, et pulvinar leo rutrum.

Duis viverra vehicula commodo. In quis consectetur metus. Suspendisse id neque efficitur est dignissim placerat non pulvinar lorem. Maecenas quis justo et lorem venenatis semper nec sed lorem. Nam gravida, ipsum vel ultrices auctor, quam tortor tincidunt elit, eget porta lacus lectus sed dui. Fusce blandit quis leo nec rutrum. Mauris tempor, nunc at finibus blandit, magna risus porta nunc, in viverra justo nisi a tortor. Phasellus est nulla, mollis vel scelerisque ac, pharetra semper leo. Suspendisse faucibus arcu nec massa fermentum, eu fermentum dui venenatis. Sed bibendum ligula eros, ut dapibus ex ultrices vel. Donec eget neque condimentum, ultrices velit vitae, commodo nisi. Nulla quis nunc facilisis, placerat nisi vitae, ullamcorper orci.

Duis pharetra, ex et tincidunt tempor, erat justo ornare ipsum, sit amet tristique metus sem sit amet lectus. Duis varius, magna id blandit ullamcorper, sem elit viverra dui, vel malesuada arcu tellus vitae odio. Nullam vitae justo ac mauris aliquet rutrum tempor ut dolor. Suspendisse accumsan varius aliquet. Vestibulum ultricies eget leo sed mattis. Etiam ultrices mauris vitae ipsum sodales condimentum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Quisque risus ex, tempor ut convallis et, rhoncus ut metus. Mauris in mi at arcu ornare dignissim sit amet sit amet tortor. Vestibulum egestas luctus velit, et tristique magna ultrices ut. Maecenas id faucibus lacus. Phasellus accumsan augue a ipsum bibendum commodo. Suspendisse vulputate odio magna, non semper mi vulputate eget. Ut sollicitudin neque sapien, ac pellentesque nibh condimentum a.

Nulla interdum rutrum ipsum, sodales tempor sapien congue id. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed vehicula a mi a bibendum. Donec sagittis erat mauris, vel vestibulum lorem varius ut. Ut ac est dapibus, feugiat purus in, ultrices neque. Sed commodo, elit a lobortis rhoncus, nibh est commodo nisl, ac feugiat nibh magna eget neque. Phasellus congue tincidunt mauris, eget venenatis lectus pretium at. Pellentesque sit amet felis eros. Proin dapibus consequat aliquet. Curabitur ultricies tincidunt eleifend.

Integer dapibus semper lacinia. Vestibulum ultricies orci quis lacinia efficitur. Curabitur non dui augue. Nulla nec semper elit. Mauris dapibus tincidunt pretium. Proin vel eros consectetur, lacinia quam non, auctor felis. In hac habitasse platea dictumst. Aliquam erat volutpat.

Duis ac lacinia urna, nec pulvinar eros. Mauris luctus id purus et condimentum. Integer quis nulla quis quam porttitor mattis in sagittis elit. Sed pellentesque urna et lorem tincidunt, et pharetra arcu efficitur. Sed sed sagittis sapien. Etiam risus metus, commodo at hendrerit at, vestibulum et augue. Sed porttitor cursus purus, a fermentum libero feugiat nec. Sed sollicitudin velit sagittis mauris rhoncus, id convallis ex sollicitudin. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Aliquam erat volutpat. Aenean venenatis, nisi sed convallis vestibulum, dui quam viverra risus, sit amet aliquam massa erat id lectus. Aenean imperdiet leo eu pretium rutrum. Donec non malesuada ipsum, a egestas felis. Proin nec fermentum quam, nec consequat tellus. Nulla imperdiet posuere est vehicula commodo. Morbi ac ipsum aliquam, luctus velit non, mollis sapien.

Nullam tincidunt dolor id pharetra efficitur. Integer mi dui, interdum eu pulvinar ac, varius quis mi. Sed aliquet auctor felis, in consequat nibh ultricies et. Morbi ut pellentesque urna. Donec varius orci sit amet nisl ullamcorper, et iaculis nibh venenatis. Praesent pellentesque eros venenatis arcu ultrices luctus. Duis quis diam lobortis, semper velit id, efficitur velit. Etiam vitae felis ac massa porttitor interdum ac ac libero.
              """,
              style: Style.mutedText(fontSize: 12),
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
