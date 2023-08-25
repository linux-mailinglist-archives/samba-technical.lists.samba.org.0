Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F80788F6E
	for <lists+samba-technical@lfdr.de>; Fri, 25 Aug 2023 21:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=JQshtyZvkSLfrPm8mLzSQnowK+pwxsGtZpGBmb/y76M=; b=QZWCoBwc3dYRp+gtz8c7IwPV36
	lrey8F+Ojbo8xJV/fjH3uAEP3xOEpSOs0LujmXrermEwst00DzPIFldmNbo6LOHb1HmVG5LvzpsNJ
	5Ou0kFWm+IekBa+lSD+HZQlpL8ypguQ7ocXwoU+cG6ugeJFsEUgzvaZBzH9nViQ6lLVnjFzqoq3hc
	mKMXpYsLwF4ma6cyf6xvRnBZW3ZS6wTwLi8A0GxVB6lq6F048Mhu+INZx1a2oozbyDvpqkEZc4qsL
	dCJWlOnuB71Re6YXmWvJ90tdB/ly9Rscsnz1gW4UkolsNphkjIE0f9P5E6Udj/eYKZPiN/ROFLcei
	OPgfS+kA==;
Received: from ip6-localhost ([::1]:36482 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qZcsY-00EWXh-Bu; Fri, 25 Aug 2023 19:53:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36182) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qZcsS-00EWXY-1N
 for samba-technical@lists.samba.org; Fri, 25 Aug 2023 19:53:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=ZESPdBmUl6u6OV/LiC++j2vRz7KA2oOAEcCJ5SbpMJc=; b=gXjW2nxgQ1YDZUsPpTGDjNGLTE
 c06a66l/0r8iO4rkf8gqVb5KyHzGvsxzs0PgDbS+DTRDyNyixlF+/oiJhWM/Dqlpk2RxIeokU+aJp
 QCR6BM73DQGqseaBG5+duNedH/3yEWap3iAif0nB5kp+fG3PXjVItkuWs/gaUb1l7txMuGBXrBjGl
 h+aad0UVNlN19xEPx8x2eInMOQJfJamHQrIRfTOhZlEv6zTCdbAuPzOR3uz804Wm9OJOD3Of/hhIx
 XLbHLWEM3nsWnymQZ/XGBhlHI0zN3mOxn09mKpgD55KaSfEaSR5NfYPT+pR3yqZXZ0zQO0sL9XwIU
 FsUtZNbcmkEOS4I5l+1kGMukIGjaB42n+xblwFA2K3Bz3n0eEJoDt56ylT7Nb9KEWvOzPiQAh/V1w
 bzKdP1W4jbCxyExc3Hz6DHSFhbvUBKUZm6+E5JCPsA5/Fhc8mUUiiU+wuYzSaHMZaSueE9HwgFNPG
 YBxuXO4gkTQF0okQnp9qvfjt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qZcsO-009zVM-0R; Fri, 25 Aug 2023 19:53:48 +0000
Message-ID: <c1ce1f871376fc4d13aec34ea9834ec1f627a03c.camel@samba.org>
Subject: Re: Error injection in the MSRPC code in Samba as an AD
To: Richard Sharpe <realrichardsharpe@gmail.com>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 26 Aug 2023 07:53:45 +1200
In-Reply-To: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
References: <CACyXjPw-ew8=qG_oAv7AY9nyMTM2On3acLdzAuh9XcFMUYVpQA@mail.gmail.com>
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2023-08-25 at 09:02 -0700, Richard Sharpe via samba-technical
wrote:
> Hi folks (and Jeremy :-),
>=20
> We have seen a bunch of issues around winbindd and issues caused by
> errors from Windows domain controllers or delays because the DCs are
> far away or slow.
>=20
> To try to create more robust code I have embarked on a project to
> allow the injection of errors into the Samba AD code when handling
> MSRPC requests.
>=20
> We tried other approaches, like using the Linux networking code to
> randomly drop packets or inject delays, but this was not very useful.
> We also tried adding error injection into the winbind code when
> handling responses, but that creates issues around packaging. So, it
> seemed like it would be easier to add it to the AD code and then
> provision test systems with the correct setups.

I've thought for more than a decade that those deploying Samba as a
file-server for customers could really benefit from using Samba as an
AD DC for testing. =C2=A0I hadn't imagined this creative use - I just
figured it would be easier to automate etc.

So I really love this!

Andrew Bartlett

--=20
Andrew Bartlett (he/him) https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Developer, Catalyst IT https://catalyst.net.nz/services/samba

