Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CA44F8599E
	for <lists+samba-technical@lfdr.de>; Thu,  8 Aug 2019 07:08:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=AIHgo9tO8/uLjpfnL7WNmouk+gtjTirZjLkTSUfLc6k=; b=w7Tn75CjM3hDyd5CW0SloApKFf
	vgatIAAXox0tQc5kWWWZcHbcrCS3Wv4opvy26pXJdfFmycUh2bcDTmudTyBqbn+3dk6Kud2oSmYJs
	NnVyIYP+rM34yFXFmoLw0kFB3VB04C8KSWvNn5RBWGJ6J77S2LPJ8L6GVt9yVlXHdnMr2WEWAMjfF
	7CldMjTxH68t80vNQunoBnubm8POTjrA52xnToiTXesJpP/WafyQo2UUlHg04++OdMikkdd4WAWAN
	HZF9P8lX99LjqPI9k5JD4pUnkbVAIoL52yipMHTC2ddaes8N+eoGyGF45kowrcl1o3gNUiFoh7JjU
	o7vVxOLA==;
Received: from localhost ([::1]:34892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hvadz-0053oe-9z; Thu, 08 Aug 2019 05:07:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvadu-0053oX-Ec
 for samba-technical@lists.samba.org; Thu, 08 Aug 2019 05:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=AIHgo9tO8/uLjpfnL7WNmouk+gtjTirZjLkTSUfLc6k=; b=jCDFXJEdjo8+zpBs0Hmq9jY3l5
 kHZfCbvSiHhsMg4z70QfHhPFOltsRa1JDlEdecoE3HOs9Uant3CxoxquXcYHUbiqdAcoZCe1Wm5nl
 jhTancy+rbD9+ez7gqXUvvg1HVkWsaD5QBzKYhAu07eqP8WX4e/Q3b92krzmfuhDH0Wo=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hvads-0003Mo-Ty; Thu, 08 Aug 2019 05:07:13 +0000
Message-ID: <1565240829.4444.5.camel@samba.org>
Subject: Re: Require GnuTLS 3.4.7 for Samba 4.12 in March 2020?
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org, Nico
 Kadel-Garcia <nkadel@gmail.com>
Date: Thu, 08 Aug 2019 17:07:09 +1200
In-Reply-To: <3136808.qJGijLCe70@magrathea.fritz.box>
References: <1564547155.4261.48.camel@samba.org>
 <CAOCN9ryBOTTTB8UR2fNX7ZMDM0hJHKT7-Ys8v-VDv4BCgp+uug@mail.gmail.com>
 <CAOCN9rz0wCkZZvzsjsXKcm4+Jv0nQWicmuk6PeYwUNGinMyq3Q@mail.gmail.com>
 <3136808.qJGijLCe70@magrathea.fritz.box>
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAIAAADYYG7QAAAAA3NCSVQICAjb4U/gAAACRklEQVRYw81YS67DIAwkVe8FPRm5menJeAu3lmUCbyBGKqsmRXjwb8Y5aq3hl9Yj/Nh6Tu0upZRS+EdKiV+e5+mJqMKLiHLORBRjzDmbc/hlvb1QD2k3sG84+dhhvF6vlzymlNY8dyBJzUdLjAwyvaeU8n6/2WHpu/xDRkREJI8cOBMgfuRQxhj58JzzbBwhQDFGA07M6/efE0MQxDHGFvpdQHy6MUxqtU4yezRcH0B4GfbM44BWGqOurF6Omz140a0ASimJvdbwZT32XrpRh5yuwY1d0vPrdNkv91+T8uBRG8l1uiX+JtsHxPNIWE27ugwTctTdHCIiYXvuy4P7IDl0CxAzl2xgZTJwgw+g3kGaHwYh5g2sljyrjIVEq4pYBg2Kq3yXZ5WxjfO7zF9jRdXrnLcEmlbTRnNpcT0gvpTScUC2HlOE2ipAvPuJanMT+Xc0PC4dFzu1DEO4HgczaS5kOnZ4vM7zxNU+mtRyRVPDgqyX3cdx8AQCCrQnfkV9VzMA9Ryg3ek8Sgsg3QX+nbz03Og5l10ytp6HusQUwpjd1rnsksbHlhjuVGdBAbWzIiJu5MvEFkA6OkiwBO4uQL3ADeQ9b57t74+FBo1s47IqpVxqBDcuQ66r94QQJOH2ctnAf9oZtdbZYejpi2bQEveO0sb2JXu09OJJrnpil4SV5G2N6Y+1QjL+gHSKDApHJoJWF3hW2fInh6lutGW216OPRBZtRZscwyQvI+KuTj3rp4VP1VsAcTobxgDngukqm3LPgmL8A4m377Y5OvTKAAAAAElFTkSuQmCC
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2019-08-01 at 08:58 +0200, Andreas Schneider wrote:
> On Wednesday, July 31, 2019 7:37:10 AM CEST Nico Kadel-Garcia via samba-
> technical wrote:
> > I only repackage that, I didn't write it, Credit where it's due, and
> > 
> > quoting from the README.md there:
> > > > This is based on sergiomb2's work at
> > > > 
> > > >  https://github.com/sergiomb2/SambaAD
> > 
> > So Sergio gets credit. But I'm already using it for RHEL 7/CenbtOS 7.
> > I've done some very limited testing with RHEL 8, but am waiting for
> > CentOS 8 to finally be released to really test  that.
> > 
> > > > [1] Sadly we couldn't totally remove the Samba AES code, as SMB 2.24
> > > > requires AES-CMAC-128, but the impact would be far more constrained.
> > 
> > Fair enough. I'd say accept the requirement of a compatibility library
> > for older operating systems, and I'm glad Sergio did most of the work.
> 
> Is there a copr repo with the compat-gnutls34 available somewhere?
> 

Do you mean this:

https://copr.fedorainfracloud.org/coprs/sergiomb/SambaAD/package/compat
-gnutls34/

Andreas,

Can you take charge of getting this into to the CentOS7 image used for
CI so we can proceed with this?

Thanks,

Andrew Bartlett
-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba





