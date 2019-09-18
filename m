Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A26AAB6E79
	for <lists+samba-technical@lfdr.de>; Wed, 18 Sep 2019 22:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=j2L2p2Njj0Z8hKsTH6dNd/+1H6fZJEQziNkWJbe4by8=; b=0HSNrRx5J0J6q8/ANG3ma9IYSQ
	CrPzStquJehl5a9cSlN7CKA2nqUj9q7eVf/C5wQisJGQKi0CrYShjv5O9qIhAEdW171XHchSXrriH
	4wpdIEKUZVRvgG3Gt1dnCEzy5Ff86AXaRGLfwD4U0vwxuvnQjbikFUlW9Q3o7cwawC6HlWnPLTS0U
	j3DnFFRegSLoyTz0vDg6It2R4Pu84hTcRRhC+MqIrEEpflQf6U8hntFobTIDLiKmPiiYAMbsyyq3Q
	LHbCHZSYKiHT6gcNFl7Xi/x7YdwOC9NJBTEM4YxgUac2fC9t0RhbbHayj4kiEDWM/NIwiDWiteqvB
	NnaizFKQ==;
Received: from localhost ([::1]:40530 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iAgsr-006h94-CA; Wed, 18 Sep 2019 20:49:05 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:38372) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iAgsl-006h8x-NY
 for samba-technical@lists.samba.org; Wed, 18 Sep 2019 20:49:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id 3so1507516wmi.3
 for <samba-technical@lists.samba.org>; Wed, 18 Sep 2019 13:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=j2L2p2Njj0Z8hKsTH6dNd/+1H6fZJEQziNkWJbe4by8=;
 b=V0Fw/7O8MjH7rI7c3Xiy50K4ud9qe5V30DcYSmVWYAZ/G2XeRA+RWpOV7XWujhDSTQ
 tPBGus8kKZz7Ros+05eYxtxwtpuPTJy/5TEun5JazAZvEz/91UDPkCF/TjOva4xe1piW
 orfGIz8jHSttqND4XhUbyTLyS6oGEemeanUaBXDUKwSFytOCM6fU3q83zI+W49VXd0uo
 AytrzyDu6IB79acue24AkY0i2X+buKzX1BdS3Cd5tKeWACOq+x8efjb766EdeHFTR/hY
 BuWuJhx2XsgmTZuLfZ4jRV4ayMYHiNsug+T0BFIYNC6l02H5Nr3FOm+t4ZL8h7MvO7lo
 tPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:content-transfer-encoding;
 bh=j2L2p2Njj0Z8hKsTH6dNd/+1H6fZJEQziNkWJbe4by8=;
 b=m1AvJYC7fYIbjIdUWesKO4IDAdglPRLZo/CIcedS1qzks+FaE+Rn8XV3yuXLIHLrfk
 oYfSZjqhKDas/Pl5S+TT31dljNMlaqRV4TyXtB3tJjekILR9hGm1Yf2c1i49oeJxhAAc
 acauUeROZSrj/Dcw0nFSnoXxqa+cZCDGS2EwmzYnAr6KiRGcMrUbYsru/VbOfrKjWXoR
 2810NQ2A5lIPyQdrsVeh30ukVaS09h3+VTDZxiErPXDlzck5mHXVE9zcxFudbi3QCYTR
 ILh4/T13vJuFJ+l7Fi5HYWzd4BOgxvuc4C6VUa9grSgqy4eQOc/tAJoeiN9g99eqe/7L
 oPrQ==
X-Gm-Message-State: APjAAAUDJ3D0J6hQcbxlk0ANvy/HjQ2s3p0feFE7A3/iUfdNYqz29Ay6
 /fk39zPd+V1Kq9x18Rp3Y+bo/Ude1IJhySHaE7jQ0AnM
X-Google-Smtp-Source: APXvYqxQcpoFNfeuG8A5PSkjbVifuyl0DfPvs84HTGTta09D+zepjzc2O5wob48lbdE9p8BCyjaEFS2L/KCsSsBIXjs=
X-Received: by 2002:a1c:80d0:: with SMTP id b199mr4333718wmd.102.1568839738870; 
 Wed, 18 Sep 2019 13:48:58 -0700 (PDT)
MIME-Version: 1.0
References: <CACyXjPxh=feYNk3o=DWxQN5xc4s8T5NNffoi_boTck1N39Rx8w@mail.gmail.com>
 <44826820.fKAd0jnEr8@u33b4e6d89a065e.ant.amazon.com>
In-Reply-To: <44826820.fKAd0jnEr8@u33b4e6d89a065e.ant.amazon.com>
Date: Wed, 18 Sep 2019 13:45:57 -0700
Message-ID: <CACyXjPwy0yR5KZeh2JpS2ZwPHNmqo36WkuN9JPH9FmzKdUPNkA@mail.gmail.com>
Subject: Re: Sites and services and queries for SRV records ...
To: samba-technical <samba-technical@lists.samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Richard Sharpe via samba-technical <samba-technical@lists.samba.org>
Reply-To: Richard Sharpe <realrichardsharpe@gmail.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Sep 18, 2019 at 1:34 PM Alexey A Nikitin <nikitin@amazon.com> wrote=
:
>
> On Wednesday, 18 September 2019 12:22:44 PDT Richard Sharpe via samba-tec=
hnical wrote:
> > Hi folks,
> >
> > I thought, perhaps naively, that if an organization is using sites and
> > services, and you do a query for SRV records from Site A for
> > _ldap._tcp.<realm> that the Windows DNS servers would return the SRV
> > records ordered with those for Site A first.
> >
> > Is there more that you have to do to ensure that? What I am seeing
> > looks like standard random round-robin order.
> >
> >
>
> The behavior of SRV RRs is specified in https://tools.ietf.org/html/rfc27=
82
> To summarize the related to your question info:
>
> The order for the servers in SRV RRs is not guaranteed, instead the clien=
ts should attempt to query those servers in the order that depends on the w=
eight and priority of the corresponding SRV RRs. In case of MS AD DS, for e=
xample, order of the SRV RRs may depend on the order in which DCs came onli=
ne and registered themselves with DNS. The weight and priority ideally shou=
ld depend on the domain topology, and IIRC there is a way to have each DNS =
server in the domain return the same server with different weight/priority,=
 or even limit the domain-global SRV RR set to just the site-specific SRV R=
Rs. But in a simple multi-site setup with all links between the sites equiv=
alent and all DNS servers providing the same SRV RR sets whether client wil=
l first pick a DC in it's local site is up to the dumb luck. What client th=
en should do is described in the DC Location mechanism specification (see  =
[MS-ADTS], [MS-NRPC], ash [MS-DISO] - some of these are deprecated, but emp=
irically still hold true), though to simplify it sends the NetLogon ping to=
 the first server it picks, and then reads the response to figure out which=
 site the client is in and whether that server is from the client's site or=
 some other site; if the first server is not the closest to the client then=
 client should make another SRV RR query, this time using the closest to th=
e client site it obtained with the first NetLogon ping response.

Thanks for that. Clearly, I didn't understand sites-and-services.

In my case the problem was a domain joining problem where we don't
know what site we are in at that point anyway.

--=20
Regards,
Richard Sharpe
(=E4=BD=95=E4=BB=A5=E8=A7=A3=E6=86=82=EF=BC=9F=E5=94=AF=E6=9C=89=E6=9D=9C=
=E5=BA=B7=E3=80=82--=E6=9B=B9=E6=93=8D)(=E4=BC=A0=E8=AF=B4=E6=9D=9C=E5=BA=
=B7=E6=98=AF=E9=85=92=E7=9A=84=E5=8F=91=E6=98=8E=E8=80=85)

