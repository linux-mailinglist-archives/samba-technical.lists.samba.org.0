Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B20F7E7E0F
	for <lists+samba-technical@lfdr.de>; Fri, 10 Nov 2023 18:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=HBN2I4w6S2JOZXzaWvxea60yl9BJdfwaW9QD1DbPlZs=; b=PObphf+3M6fpLfCVSuTvhFv1eU
	fkidUzMbz1eNQ9rFZIA7Ep31HsOamvP4rOWmn/sTA6SJoPtc+i62cj1dmQsU4SuhLe8Eux8tMnHn3
	ecfm8zGbz/DvG+69ewZi5x1HmpMwTwNnFtn3DAd/7f3uCal6Om0fuT8/cAlignyZIxobuUPdBFPBd
	VRH+lr19ZTJ4VBAgp3IKgWLq1ucOEaYCiVEiiju/NuDmLbY8kfPzh4Wm40A52D0v8ljWrBkrL8ruS
	KzgtqK/2vHcuvMBPPtNVzq0cjUEHGNNuS/Y10jhBFL06w7aW3U0Q/Sg54Z2QknBcLEOA4oakCRDpB
	mmSovIcg==;
Received: from ip6-localhost ([::1]:58416 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1r1V8g-007jMo-N2; Fri, 10 Nov 2023 17:17:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52808) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1r1V8c-007jMf-7Q
 for samba-technical@lists.samba.org; Fri, 10 Nov 2023 17:17:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=HBN2I4w6S2JOZXzaWvxea60yl9BJdfwaW9QD1DbPlZs=; b=jHTO2fX095kWp/hGZy3JAXq7/7
 CJS5Iiy6bxh3ARhCc43Ypqsr0H1CE4lOjieQsPIzSBPXJNuESNZe5sdEX7yHV87IKVF6zpAJW24GB
 iAzjPebdzJmRRqsMHgwnFltHOWH/MQ2cg2I9cSMD+vR5qGwdi7tiXNS9lkuOTmgJyj5tl+V19aSwE
 EMT/ieeMvIWS7tyiBZRKWx0gFeKvx6y94WYE4XbkgnsapPB84fgc32sRJBJ4x9XkK3ghDjBaLtWMP
 zI5LcGNytAWzmNn3qBfjq/7NUPa5uhLjchlgLNM9G4Zs6EAVFoC/V7clJY8Z/RAa4AnCkwRleiCdu
 o91OH+8dG6YhzuCd8Jpug564GNzRkZBtCKzjbn0F+0MNY6yuwW8ZryczL5nvrQGQvqouyXlKmoWsi
 Izf6UBLhmiZtGvqpPwU57Whxd+GAekyifPBxO7Zn0ZsIRdph4wBZo23UJvbR9dF4nRQxAzi4SLcF/
 p82yHDGC7NuHZ2a7VE3/iLKn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1r1V8b-005Xah-1a for samba-technical@lists.samba.org;
 Fri, 10 Nov 2023 17:17:45 +0000
Message-ID: <d448a7a3e35c3d79eb77c34eadcbaebf8c5fe57d.camel@samba.org>
Subject: Re: The Evolution of Windows Authentication: Microsoft's plan to
 end NTLM (eventually)
To: samba-technical@lists.samba.org
Date: Fri, 10 Nov 2023 12:17:43 -0500
In-Reply-To: <2e3c82031407ccfa2fcd96e4e374903fefebb4e4.camel@samba.org>
References: <2e3c82031407ccfa2fcd96e4e374903fefebb4e4.camel@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
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
From: Simo Sorce via samba-technical <samba-technical@lists.samba.org>
Reply-To: Simo Sorce <idra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, 2023-11-07 at 21:24 +1300, Andrew Bartlett via samba-technical
wrote:
> This is worth a watch: https://www.youtube.com/watch?v=3DSEtARCtGP0Y
>=20
> We need to think about getting Samba to implement IAKerb

MIT kerberos already has support for it.


