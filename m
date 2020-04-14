Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAFD1A7529
	for <lists+samba-technical@lfdr.de>; Tue, 14 Apr 2020 09:49:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=dSB/4I76m76tRNleCh24cACZ/lLVu/9szhK8v0OJ0yk=; b=ALYox+d0iiB22S6MQyIz6DyQfB
	SQnzMyWBPRtrRY7VWEKL3zC2RF3OPtF649MxOc7xQ0k0j/O869R8OS0+u+JNy0m+0lOAnu5JcmDYN
	T6q8+0GvTuqyjK+Vd75Ihvr69UbFgAIFUTR8O3qp7JQIlntIX3nF7fuMp7el2AFbvlQYj8fuLyegJ
	UoodFPKNdlIGXVOyORf2vDPc4g9+bESU25keMsMGrb5T5jzTdDq+8sfbyeD5gGrpv9SFSMU065XPC
	SPDhPxUW/5yEu7t65ejmfW9npvJA/IY1TKUsVUEgU2qjAPxeXk/OpZOo/wzt9/3ir1JjKA3Z5GzBw
	MmpoVhLA==;
Received: from localhost ([::1]:56572 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jOGIg-000f7C-S8; Tue, 14 Apr 2020 07:48:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60332) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jOGIW-000f75-6m
 for samba-technical@lists.samba.org; Tue, 14 Apr 2020 07:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=dSB/4I76m76tRNleCh24cACZ/lLVu/9szhK8v0OJ0yk=; b=bLRF2ac9/9npwpzEUvzTmauaGd
 sxX6cC8IWIJKkdFMihIyN4qLRglhP20G28zbbr9IneQffW98onlojDlq0oh5r1H8IvCzshRh/ebKx
 W0wATrt2VCRh9K3+B7On/aBwUM2qBH8SgKxYflSyY1jYiegOTtYSIYNiMcymhZIDYh4o0orfdHxWr
 TbATsxjus7+tQK6YLKoOzdcaVUs8Tk+8N+GridisTWMuizsQwEQrrcnzz9D1lyX4qJr/0rpsabBU3
 AdOrJ1btAxzEc4UnUa81MoT9GqzdkOTYcXFksKYpjaOt+fgDfJ7UYBfDP/kQSY0zLn+kzW7DXHLXR
 XNBQxYJ4kvvMTlHk5fI4dYIOCYPM9SBse53BHIymgy+rsseIKWDXhk9P2GQd/MxAt0tQRiEeeEnm4
 E3zZFh4Dp9uXgVqz1GdWsPQKlQvaxWo6dwgkDpQ8mGpmgrsp1Ww6WHtdi7bQYjnBM2X70vAtyHMhe
 TLEO0T/hnO6cdf7RdHjftHaD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1jOGIV-0006v7-7n; Tue, 14 Apr 2020 07:47:55 +0000
To: <130273@edu.singelland.nl>
References: <mailman.12.1586520002.86114.samba-technical@lists.samba.org>
 <DA77E830-62F3-444B-B403-6692EB35833F@edu.singelland.nl>
In-Reply-To: <DA77E830-62F3-444B-B403-6692EB35833F@edu.singelland.nl>
Subject: RE: samba-technical Digest, Vol 208, Issue 10
Date: Tue, 14 Apr 2020 09:47:54 +0200
Message-ID: <753C569ECE9A49C1B3B9625BADACEE5C@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 11
X-MimeOLE: Produced By Microsoft MimeOLE
Thread-Index: AdYSMQFbuuUy7ExeRWuMLoZiuDn4vw==
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

(Dutch version)

Hallo,=20

Zolang je zelf niet afmeld blijf je deze emails krijgen.=20
Reply zoals onderstaande werkt dus niet.=20
Via : https://lists.samba.org/mailman/listinfo/samba-technical=20
Kan je afmelden.=20

( Frysk version)=20

Salang't jo jo net =F4fskriuwe, sille jo dizze e-mails trochgean.
Antwurd lykas hjir=FBnder wurket net.
Fia:  https://lists.samba.org/mailman/listinfo/samba-technical=20
Jo kinne jo =FAtskriuwe.

(English version)
Hello

As long your not unsubscribing yourself, you will keep getting these =
mailing
e-mails.=20
Replying like that does not do anything.=20
Through : https://lists.samba.org/mailman/listinfo/samba-technical=20
Your able to unsubscribe.=20


De beste groeten/mei freonlike groetnis/Best regards,=20

Louis



> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> 130273--- via samba-technical
> Verzonden: maandag 13 april 2020 21:28
> Aan: samba-technical@lists.samba.org
> Onderwerp: Re: samba-technical Digest, Vol 208, Issue 10
>=20
> Kap hiermee
>=20
> Verstuurd vanaf mijn iPhone
>=20
> > Op 10 apr. 2020 om 14:00 heeft=20
> samba-technical-request@lists.samba.org het volgende geschreven:
> >=20
> > ???Send samba-technical mailing list submissions to
> >    samba-technical@lists.samba.org
> >=20
> > To subscribe or unsubscribe via the World Wide Web, visit
> >    https://lists.samba.org/mailman/listinfo/samba-technical
> > or, via email, send a message with subject or body 'help' to
> >    samba-technical-request@lists.samba.org
> >=20
> > You can reach the person managing the list at
> >    samba-technical-owner@lists.samba.org
> >=20
> > When replying, please edit your Subject line so it is more specific
> > than "Re: Contents of samba-technical digest..."
> > Today's Topics:
> >=20
> >   1. Re: tldap search paged (swen)
> >   2. Re: tldap search paged (Christof Schmitt)
> >   3. Re: tldap search paged (Jeremy Allison)
> >   4. PANIC: assert failed at ../../lib/dbwrap/dbwrap.c(82):
> >      rec->value_valid when connecting to samba (Rouven WEILER)
> > <mime-attachment>
> > <mime-attachment>
> > <mime-attachment>
> > <mime-attachment>
> > _______________________________________________
> > samba-technical mailing list
> > samba-technical@lists.samba.org
> > https://lists.samba.org/mailman/listinfo/samba-technical
>=20
>=20


