Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5F4375C33
	for <lists+samba-technical@lfdr.de>; Thu,  6 May 2021 22:29:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Date:Subject:cc;
	bh=yOnuJH4IOjhTxlyt0qeKYqfswZdwVGcWXWYNrmfcqqQ=; b=aUw6FNo55P1xwZZzkrWHs4CYJ+
	7rD0N5KzkthRjT6SWncQFTGRHiw8Afas33WNTrds2tjpuGgYFHqnyBVe3T/mGHKjrMd7+l+cc7sSx
	4D2xIueIzcFsnosBrF2mmTCF9b67eqVAZ8UF/2k8hA8tBINxfOj4DMkON5bV1ODs4OZidutgK5Y1t
	OhFAQ8ZXPhs/yE8ZAr3HFuCyp1WV97qjnssQEQRMr3GOFND1ckz8YWL8aORsrweAChFKdVTGoo1gO
	GyaEJUN3EH+HzAWP0YwRFfKL5UztJKttr/q7ixhD4kvu1fczB7z4V8U7ccFpk6xaBNWIqRe0wFd1h
	3kkkN4jg==;
Received: from ip6-localhost ([::1]:51054 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lekbr-00G3LO-Q0; Thu, 06 May 2021 20:28:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:28890) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lekbn-00G3LF-Go
 for samba-technical@lists.samba.org; Thu, 06 May 2021 20:28:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:Date:Message-Id:From:CC;
 bh=yOnuJH4IOjhTxlyt0qeKYqfswZdwVGcWXWYNrmfcqqQ=; b=f/fv9eiQ9ifUD54fbbpQ0hS43k
 V8RCsj2lbqLR4qaDsYDaP79mh7uAYrpXFevzjqIN36K+Y0PSL7R7JKUVhnqpP0uOO2tNu8eoSyRtt
 NxdTnue4zXM38fXyBPemC7hAoqe7hwb3pM7fx0O2OnnDKXKabG28xXUdUcEIzCYMU5bjGNFaDTg7h
 yTcrL/Sn2tTHrf3dlj7D9auV4V0QOUxv/HoSnxQb1tHerl+Rf0wAVhuc4Cw2BsWdwzL4wHh7UaWOg
 eFSmD9jEj2tYdZSRsz8Lq0I7caR++of+rte3U8Peu1dsxgQ8NyGgIG4jYDqGaws7oEB92ia6M+NII
 Fl3zCBCl+dIAH1TI8yyyylZwBO+uDyWmsW4ND53Gcro0FzydK5sDgReclgBZGbzDzKj1SdN5PJaLf
 aU5sFeU9+lVMq2NOUvOlTwpNZI0G0ftMn6UPPiBjXh2BCslZ+UkQVAciXGPxwXNJw1+B21iovHU7K
 Gt73STwEMMMTydrYMtx/Uwbs;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lekbm-00036y-3N
 for samba-technical@lists.samba.org; Thu, 06 May 2021 20:28:30 +0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Introducing the samba-in-kubernetes project (SINK)
Message-Id: <29083327-12B7-4BB3-B1F9-273DB79C789A@samba.org>
Date: Thu, 6 May 2021 22:28:29 +0200
To: samba-technical@lists.samba.org
X-Mailer: Apple Mail (2.3654.60.0.2.21)
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
From: Michael Adam via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Adam <obnox@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi all,

At last year=E2=80=99s sambaXP conference, I introduced kubernetes =
concepts and possible use cases for samba in the era of the container =
platform and demoed the prototype of a samba-operator. Slides and =
recordings can be retrieved from the sambaXP archives [1], and the video =
is also available on youtube [2].

In the meantime, the prototype has grown a real ecosystem:

We have created an organization samba-on-kubernetes (SINK) on github =
[3], containing a few initial repositories:

- samba-operator [4] - the operator code
- samba-container [5] - samba container (file and ad containers)
- sambacc [6] - configuration tool for samba in the container

We have also created a public =E2=80=9Csamba.org=E2=80=9D organization =
on the quay.io container registry [7]. Pull requests on the code repos =
are tested in kubernetes and container images of the operator and the =
samba container are automatically built and published to quay after =
merging. The quay.io space can of course be used to host other, =
community-facing samba containers!=20

Today, at the sambaXP conference, John Mulligan and I gave a =
presentation of the current state of the project, including a demo, and =
an overview of the work that is currently being done as well as an =
outlook of things on the roadmap. The sambaXP website [8] will be =
updated with slides and recordings (will also be available on youtube =
with an ETA next week as I heard :-) .

Contributions to this extension of the samba ecosystem are of course =
highly welcome! - Issues, pull requests, and also the github discussion =
board work in addition to discussions on the samba-technical mailing =
list.

Cheers - Michael


[1] https://sambaxp.org/archive-data-samba/sxp20/sxp20-d2/=20
[2] https://www.youtube.com/watch?v=3D8u74SDHxD6A=20
[3] https://github.com/samba-in-kubernetes=20
[4] https://github.com/samba-in-kubernetes/samba-operator=20
[5] https://github.com/samba-in-kubernetes/samba-container=20
[6] https://github.com/samba-in-kubernetes/sambacc=20
[7] https://quay.io/organization/samba.org=20
[8] https://sambaxp.org/=20


