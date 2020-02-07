Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FBF1552CA
	for <lists+samba-technical@lfdr.de>; Fri,  7 Feb 2020 08:18:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=/sfTkY5tp7azoYCuKI3aNo+mExBS4Kn0e3uAYDDWgUQ=; b=nqx9mI/bi6qRXHGejFJ9E+0/1N
	evjtlmPxC3ltktmq9Knk2VHy/i34f1k61FlVnzpAkVNaanOBtsHF9kdi9xXkgKGl+7fD5ek68mj7l
	p2hvhKkBr6e6NYmH33Yiri9PiAVhqNrU06NLHG9IfXAp1LaqKP5IPibRhh91eHqunRtbLNxUNZV83
	sW+lqFU0fdlY3uR4n6VRaZTloLgPxyuOZyJNQUBUpGMUbYbHqgo550iwIa8vMT0gxkZ+PX4HPVsCy
	kq9x5vNic6s0OG+Ub/+sQnyQBNIBTJWcyEHsts4wBpQTdOK4XNqz3qMoTNVr8D+t1wqyrL/fAArxY
	4MARNx9A==;
Received: from localhost ([::1]:60972 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izxtE-008Zgb-BY; Fri, 07 Feb 2020 07:17:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53212) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izxt3-008ZgU-LX
 for samba-technical@lists.samba.org; Fri, 07 Feb 2020 07:17:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=/sfTkY5tp7azoYCuKI3aNo+mExBS4Kn0e3uAYDDWgUQ=; b=bChZNENJGVenYuVDG+LLxqYrPb
 avQtU9lFeI2YTvOCeIy+bt/JrCyxMZWGVzzonj6fQeXlGj5t03RyAbNa0VTQo9NXdfPRckGsqR/bc
 cxGLtHY6uUczYknPD/7T/3gCdcTUgx4Yp+A7Y+yHGi1mDreooTgopoNYp1nJWIzwa0NZl4xAZTlXU
 sP5T3MZvvUKN4M2+PBzlElFK/Kv9Gg5pB+smkRHnhpAa+T+gVBMzzTHNu8CBvIx+8JQlE1nznhda9
 dj2zktpBHYYXJ/OJxfuZ53ykOdDW9SwaR5E3mhM5Yo2Js3nlzYtsVV6I+og9jyxcWLnNP/tbj9RfR
 u013cIO8l0cNPlJjL5txNAOvHm3YaeIeA09IMi2GoVPV3TY/RKYXH6y8NPHDxK1v3Xdi5BLbebM0t
 23IdTAa/Y4FLISKH3cXn0oCObvfZUD24/iYDYoij8Kwsgklv8fbWwz94ffbcf0CM67Uo9W6utQs0L
 jutWYYm7oXPENkEHcuCFx9/a;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izxt1-00061S-0d; Fri, 07 Feb 2020 07:17:11 +0000
To: gd@samba.org
Subject: Re: Video of my FOSDEM Samba talk.
Date: Fri, 07 Feb 2020 08:17:08 +0100
Message-ID: <1629429.vCTcVmRLes@magrathea>
In-Reply-To: <20200206165543.GA214397@jra4>
References: <20200206165543.GA214397@jra4>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Cc: samba-technical@lists.samba.org, Jeremy Allison <jra@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 6 February 2020 17:55:43 CET Jeremy Allison via samba-technica=
l=20
wrote:
> For people who couldn't be there who might
> be interested !
>=20
> https://ftp.osuosl.org/pub/fosdem/2020/H.1308/whats_new_in_samba.webm
> https://video.fosdem.org/2020/H.1308/whats_new_in_samba.mp4

G=FCnther, he called our (MS-PAR) work legacy! I think we should assign som=
e=20
printing bugs to Jeremy ... :-)

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



