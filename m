Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4399D36EB40
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 15:23:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=hVEgeca2rhSDcMLNvuyHasQ+zO5FztTgfhQBC2Gduf8=; b=b09DQb+yPO2gcMwN8SMS9GJFCA
	7bmlzUwXspXMSshviCY3f6HOUuUwnO//8GKo47pht8SYZeu/0LupJn/6IIXrGPd1VnzcKqT/QEusH
	+Co0zpiC/worsprXigpK/Zx+fda7kxySNfws81HnNjX4dzPZz13AbxuwaRn/VWEzDqhjaR55aOxJw
	FH+EfvhG2dpCUDhV/r7j3uatFTnSRgoh5gV6zejViu7KDjb5EL7+Tz3yRku99varlJrTNECXh9BRh
	+C2xVt+mJCBAgBbU5GBBVQ+L/wsO009q2TM35yfQP7yo2C1TMuBsnEX59oUmnp3RnCABVQbuYxUmO
	E0Wqv+mg==;
Received: from ip6-localhost ([::1]:36342 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lc6d9-00D95f-VL; Thu, 29 Apr 2021 13:23:00 +0000
Received: from mailhopper2.bazuin.nl ([195.134.173.123]:35390) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lc6d3-00D95Y-Oy
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 13:22:56 +0000
X-Bazuin-en-Partners-MailScanner-Watermark: 1620307361.89524@lCDG0xL8CZYWoi9t8gdcEQ
X-Bazuin-en-Partners-MailScanner-From: belle@bazuin.nl
X-Bazuin-en-Partners-MailScanner: Found to be clean
X-Bazuin-en-Partners-MailScanner-ID: 6693511F265.A3D3D
X-Bazuin-en-Partners-MailScanner-Information: Please contact Bazuin en
 Partners for more information
Received: from ms249-lin-003.rotterdam.bazuin.nl
 (ms249-lin-003.rotterdam.bazuin.nl [192.168.249.243])
 by mailhopper2.bazuin.nl (Postfix) with ESMTP id 6693511F265;
 Thu, 29 Apr 2021 15:22:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=bazuin.nl;
 s=mail20180308; t=1619702561;
 bh=zPXx1S1XyjGlWJtXh3J5Y6po9yA0OuYZDA+oryAhU3E=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=LN8t3lZHhWYkMWWAJi9zu9bs6LR9D4IUfHZofVFgUl+cX5LPJQPCqrc6KBGpfC6aQ
 JdfFxX5GFuflmHALQos9BjHC0CSMt6o5nMCtJnVOLjIlolnKVDEcuv9F8t7fFyd2B/
 AvLxvyhixpMf7z3PN4zd6SbwWUzxhATgYTW0fzQJYLmiMpVL1sN6FJpkpl27sigRU/
 SHHkbh40UYPg1qYtr7myM956kY2ZrNsySmQNskCyV/veBY+Gbcbac+PRvFJFPhQe1M
 Tj8T867ogUrr4pZ8saBSVEMiCRZyPsIy9EonbliUlUwBYzZzIuC9aaKYY4Ga+jJVm/
 wdkIBLen4bl6A==
Received: from ms249-lin-003.rotterdam.bazuin.nl (localhost [127.0.0.1])
 by ms249-lin-003.rotterdam.bazuin.nl (Postfix) with SMTP id B290418C2496;
 Thu, 29 Apr 2021 15:22:47 +0200 (CEST)
Subject: RE: Ubuntu's ADSys
To: =?windows-1252?Q?Rowland_penny?= <rpenny@samba.org>
Date: Thu, 29 Apr 2021 15:22:47 +0200
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <eccdfa03-56d0-85ec-62b8-30b4c84f39b4@samba.org>
References: <YIaZmO3WleOfenUn@pinega.vda.li>
X-Priority: 3 (Normal)
X-Mailer: Zarafa 6.30.19-25148
Thread-Index: Adc8+r62qVub4JpCRIWiskWzxl8msA==
Message-Id: <vmime.608ab327.345.7841bc1123a20017@ms249-lin-003.rotterdam.bazuin.nl>
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
From: "L.P.H. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "=?windows-1252?Q?L.P.H._van_Belle?=" <belle@bazuin.nl>
Cc: "=?windows-1252?Q?samba-technical=40lists.samba.org?="
 <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hai Rowland,=20

Do you think its usefull to have it in Debian available=3F=20
And if yes, ... Well, you have the fix ;-)=20


Greetz,=20

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical=20
> [mailto:samba-technical-bounces@lists.samba.org] Namens=20
> Rowland penny via samba-technical
> Verzonden: donderdag 29 april 2021 11:41
> Aan: samba-technical
> CC: samba-technical@lists.samba.org
> Onderwerp: Re: Ubuntu's ADSys
>=20
> On 26/04/2021 11:44, Alexander Bokovoy wrote:
> > On ma, 26 huhti 2021, Rowland penny via samba-technical wrote:
> >> On 26/04/2021 11:27, Douglas Bagnall via samba-technical wrote:
> >>> I noticed that Ubuntu 21.04 was announced with "native=20
> Microsoft Active
> >>> Directory integration":
> >>>
> >>> https://ubuntu.com/blog/ubuntu-21-04-is-here
> >>>
> >>> It looks like this is based on a project called "ADSys"=20
> (GPLv3, written in
> >>> Go), that works as a GPO client.
> >>>
> >>> https://github.com/ubuntu/adsys
> >>>
> >>> They use Samba in their tests, as far as I can tell.
> >>>
> >>>
> >>> Douglas
> >>>
> >>>
> >> Well, if they did use Samba, which version of Samba =3F I=20
> ask because I tried
> >> 21.04 in a VM against my Samba AD domain and it didn't=20
> work. No matter what
> >> permutation of username I used, I couldn't log in. I found=20
> out that 'getent'
> >> didn't return any AD users.
> >  From my cursory look over the code, there is an assumption=20
> that AD users
> > all named fully-qualified, e.g. user@ad.domain. @ is hard-coded in
> > multiple places. They seem to test it with SSSD.
> >
> >
>=20
> I had another look at this by installing Ubuntu 21.04 in a new VM. It=20
> still didn't work, but by working through the errors, I tracked it to=20
> sssd. Installed the fix I found on the internet and it now works.
>=20
> Rowland
>=20
>=20
>=20
>=20


