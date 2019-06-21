Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F8C4DEE7
	for <lists+samba-technical@lfdr.de>; Fri, 21 Jun 2019 03:59:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=cB8jo8G6dYt4IIh4GcsEqNKzrHqUSN4X/+iq/qCJr0A=; b=xNnXmtchoNYo8dn9TnOR8tAJuu
	5Tobn2kyWfQPCecqZP0wz9uujGCnvNSOPxuTqLTjEaqWuL5HesbCdBNzBFfv/06RVYZCOyDYO8tNs
	g0H2BiZmQSqYKopESlpfSmbIveCZ4YR6iYM5r3DvJ/u0eHeGQ1zTStNLsiTPcABkrGlgRnfuyvUNm
	83seMPlCdUDcwsW0pRYZMVdKVNHfeifdV1lIQeJLNp5kd1imvy8ktDtnKBz9GOHE4JD1xu9mUVXZ5
	jEXh8LJfGmU3ZahmwFudMrELZJ71axTPlCALe75GdCIK2VCTv4KoCgVRvFEILS81gh8ZuTHMxuHYM
	GATMnoEA==;
Received: from localhost ([::1]:48470 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1he8ov-000qgg-7J; Fri, 21 Jun 2019 01:58:29 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1he8oh-000qgZ-Ho
 for samba-technical@lists.samba.org; Fri, 21 Jun 2019 01:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Cc:To:From:Message-ID;
 bh=cB8jo8G6dYt4IIh4GcsEqNKzrHqUSN4X/+iq/qCJr0A=; b=TXBP5xkj8z+kY7ynN/RFBfotdD
 H5/Wzs/WLLCE4L/1pEXQRqF+MWiVz7AePT6Wz+MgzIG1MfiKn6Cw6+G5SvlLFHRViSAUBGyl9y2Zy
 QCOHgphj3aIA/Zf1tyCMtayYcB5N5nc3Izmn/YszYXxCP52dQ2JNNwxNrSQAP8J+0uUY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1he8of-00041x-Dl; Fri, 21 Jun 2019 01:58:14 +0000
Message-ID: <1561082290.28284.28.camel@samba.org>
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Martin Schwenke <martin@meltin.net>, cs@samba.org
Date: Fri, 21 Jun 2019 13:58:10 +1200
In-Reply-To: <20190621111436.342f713e@martins.ozlabs.org>
References: <1561079117.28284.21.camel@samba.org>
 <20190621111436.342f713e@martins.ozlabs.org>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: multipart/mixed; boundary="=-lqPK7HiReBI8BK6SuhCk"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>


--=-lqPK7HiReBI8BK6SuhCk
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-06-21 at 11:14 +1000, Martin Schwenke via samba-technical
wrote:
> On Fri, 21 Jun 2019 13:05:17 +1200, Andrew Bartlett via samba-technical
> <samba-technical@lists.samba.org> wrote:
> 
> > I gave a talk at SambaXP about our first year with GitLab, and one
> > point I made is that it is *not OK* to have public contribution
> > documentation that does not match our actual practice.

> > So, I would like to propose this.  That given the practice of the Samba
> > Team and almost all contributors is to contribute via a merge request
> > against https://gitlab.com/samba-team/samba that we document this, and
> > only this, as how to contribute to new patches to Samba.
> > 

> I don't think it is the practice of the whole Samba Team.  I haven't
> managed to get into the GitLab workflow, though I have used it.
> 
> Perhaps I'm the only one, but I don't think we should be mandating this
> (yet?)...

G'Day Martin,

Thanks for the feedback.  I should have checked rather than working on
a 'gut feel' and I see you are still using samba-technical a fair
bit[1].  

I would say that aside from your patches, the vast majority of the
patch flow has moved to GitLab.

To help us present a clear process, do you think you could embrace
GitLab, if not for the benefits to you, but for the sake of our new
contributors?

The alternatives are (to my mind):
 - Contributors get ignored on samba-technical (both because the
patches are not known-good and because they are not on a clear to-do
list)
 - Contributors other than yourself keep getting told off for doing it
'wrong'.

What do you think?

Christof,

You are the other person I still using samba-technical much at all to
submit patches.  Is there anything I can do to help you make the move
to GitLab, or is there anything stopping you?

Thanks,

Andrew Bartlett

[1] Attached is the histogram of patches on samba-technical from April
-> June, for the curious.  

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba




--=-lqPK7HiReBI8BK6SuhCk
Content-Disposition: attachment; filename="still-using-samba-technical.txt"
Content-Type: text/plain; name="still-using-samba-technical.txt"; charset="UTF-8"
Content-Transfer-Encoding: base64

ICAgICAgMSBGcm9tOiA9M0Q/VVRGLTg/cT9HPTNEQzM9M0RCQ250aGVyPTNEMjBEZXNjaG5lcj89
M0QgPGdkQHNhbWJhLm9yZz4NCiAgICAgIDEgRnJvbTogQWFyb24gSGFzbGV0dCB2aWEgc2FtYmEt
dGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPgogICAgICAxIEZyb206
IEFtaXRheSBJc2FhY3MgPGFtaXRheUBnbWFpbC5jb20+DQogICAgICAxIEZyb206IEFtaXRheSBJ
c2FhY3MgPGFtaXRheUBzYW1iYS5vcmc+CiAgICAgIDEgRnJvbTogQW1pdGF5IElzYWFjcyB2aWEg
c2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPgogICAgICAx
IEZyb206IEFtaXQgS3VtYXIgPGFtaXRrdW1hQHJlZGhhdC5jb20+DQogICAgICAxIEZyb206IEFu
ZHJlYXMgU2NobmVpZGVyIDxhc25Ac2FtYmEub3JnPg0KICAgICAgMSBGcm9tOiBBbmRyZWFzIFNj
aG5laWRlciB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEu
b3JnPgogICAgICAxIEZyb206IEFuZHJldyBXYWxrZXIgdmlhIHNhbWJhLXRlY2huaWNhbCA8c2Ft
YmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAgMSBGcm9tOiBBbm9vcCBDIFMgPGFu
b29wY3NAcmVkaGF0LmNvbT4KICAgICAgMSBGcm9tOiBBbm9vcCBDIFMgdmlhIHNhbWJhLXRlY2hu
aWNhbCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAgMSBGcm9tOiBJc2Fh
YyBCb3VrcmlzIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1i
YS5vcmc+CiAgICAgIDEgRnJvbTogSmVyZW15IEFsbGlzb24gdmlhIHNhbWJhLXRlY2huaWNhbCA8
c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAgMSBGcm9tOiBKb25lcyBTeXVl
IHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+CiAg
ICAgIDEgRnJvbTogUGF2ZWwgU2hpbG92c2t5IDxwaWFzdHJ5eXlAZ21haWwuY29tPg0KICAgICAg
MSBGcm9tOiBQIE1haXJvIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0
cy5zYW1iYS5vcmc+CiAgICAgIDEgRnJvbTogUmljaGFyZCBTaGFycGUgdmlhIHNhbWJhLXRlY2hu
aWNhbCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAgMSBGcm9tOiBSaWth
cmQgRmFsa2Vib3JuIDxyaWthcmQuZmFsa2Vib3JuQGdtYWlsLmNvbT4KICAgICAgMSBGcm9tOiBS
aWthcmQgRmFsa2Vib3JuIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0
cy5zYW1iYS5vcmc+CiAgICAgIDEgRnJvbTogUm9iZXJ0IFNhbmRlciA8ci5zYW5kZXJAaGVpbmxl
aW4tc3VwcG9ydC5kZT4NCiAgICAgIDEgRnJvbTogUm9iZXJ0IFNhbmRlciB2aWEgc2FtYmEtdGVj
aG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3JnPgogICAgICAxIEZyb206IFN0
ZWZhbiBCZWhyZW5zIDxzYmVocmVuc0BnaWFudGRpc2FzdGVyLmRlPgogICAgICAxIEZyb206IFN0
ZWZhbiBCZWhyZW5zIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5z
YW1iYS5vcmc+CiAgICAgIDEgRnJvbTogU3RldmUgRnJlbmNoIHZpYSBzYW1iYS10ZWNobmljYWwg
PHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+CiAgICAgIDEgRnJvbTogPT9VVEYtOD9R
P0c9YzM9YmNudGhlcl9EZXNjaG5lcj89IDxnZEBzYW1iYS5vcmc+DQogICAgICAxIEZyb206ID0/
VVRGLTg/UT9HPWMzPWJjbnRoZXJfRGVzY2huZXI/PSB2aWEgc2FtYmEtdGVjaG5pY2FsCiAgICAg
IDEgRnJvbTogVm9sa2VyIExlbmRlY2tlIDx2bEBzYW1iYS5vcmc+DQogICAgICAyIEZyb206IEFt
aXQgS3VtYXIgdmlhIHNhbWJhLXRlY2huaWNhbCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJh
Lm9yZz4KICAgICAgMiBGcm9tOiBBbm9vcCBDIFMgPGFub29wY3NAcmVkaGF0LmNvbT4NCiAgICAg
IDIgRnJvbTogTHVrYXMgU2xlYm9kbmlrIDxsc2xlYm9kbkBmZWRvcmFwcm9qZWN0Lm9yZz4NCiAg
ICAgIDIgRnJvbTogTHVrYXMgU2xlYm9kbmlrIHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRl
Y2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+CiAgICAgIDIgRnJvbTogTHV0eiBKdXN0ZW4gPGxqdXN0
ZW5AZ29vZ2xlLmNvbT4NCiAgICAgIDIgRnJvbTogUmFscGggV3VlcnRobmVyIHZpYSBzYW1iYS10
ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+CiAgICAgIDIgRnJvbTog
U2h5YW0gUmF0aGkgdmlhIHNhbWJhLXRlY2huaWNhbCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNh
bWJhLm9yZz4KICAgICAgMiBGcm9tOiBUaW0gQmVhbGUgdmlhIHNhbWJhLXRlY2huaWNhbCA8c2Ft
YmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAgMyBGcm9tOiBEb3VnbGFzIEJhZ25h
bGwgdmlhIHNhbWJhLXRlY2huaWNhbCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4K
ICAgICAgMyBGcm9tOiBSYWZhZWwgRGF2aWQgVGlub2NvIHZpYSBzYW1iYS10ZWNobmljYWwgPHNh
bWJhLXRlY2huaWNhbEBsaXN0cy5zYW1iYS5vcmc+CiAgICAgIDMgRnJvbTogUmFscGggV3VlcnRo
bmVyIDxyYWxwaC53dWVydGhuZXJAZGUuaWJtLmNvbT4NCiAgICAgIDMgRnJvbTogUm91dmVuIFdF
SUxFUiB2aWEgc2FtYmEtdGVjaG5pY2FsIDxzYW1iYS10ZWNobmljYWxAbGlzdHMuc2FtYmEub3Jn
PgogICAgICAzIEZyb206IHN3ZW4gdmlhIHNhbWJhLXRlY2huaWNhbCA8c2FtYmEtdGVjaG5pY2Fs
QGxpc3RzLnNhbWJhLm9yZz4KICAgICAgNCBGcm9tOiBHYXJ5IExvY2t5ZXIgPGdhcnlAY2F0YWx5
c3QubmV0Lm56Pg0KICAgICAgNCBGcm9tOiBHYXJ5IExvY2t5ZXIgdmlhIHNhbWJhLXRlY2huaWNh
bCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAgNyBGcm9tOiBDaHJpc3Rv
ZiBTY2htaXR0IHZpYSBzYW1iYS10ZWNobmljYWwgPHNhbWJhLXRlY2huaWNhbEBsaXN0cy5zYW1i
YS5vcmc+CiAgICAgMTAgRnJvbTogRG91Z2xhcyBCYWduYWxsIDxkb3VnbGFzLmJhZ25hbGxAY2F0
YWx5c3QubmV0Lm56Pg0KICAgICAxMiBGcm9tOiBNYXJ0aW4gU2Nod2Vua2UgdmlhIHNhbWJhLXRl
Y2huaWNhbCA8c2FtYmEtdGVjaG5pY2FsQGxpc3RzLnNhbWJhLm9yZz4KICAgICAxNCBGcm9tOiBU
aW0gQmVhbGUgPHRpbWJlYWxlQGNhdGFseXN0Lm5ldC5uej4KICAgICAxNyBGcm9tOiBDaHJpc3Rv
ZiBTY2htaXR0IDxjc0BzYW1iYS5vcmc+DQogICAgIDQ4IEZyb206IE1hcnRpbiBTY2h3ZW5rZSA8
bWFydGluQG1lbHRpbi5uZXQ+DQo=


--=-lqPK7HiReBI8BK6SuhCk--


