Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E2A114C7A
	for <lists+samba-technical@lfdr.de>; Fri,  6 Dec 2019 07:56:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=WtSA8aFQZKcqELkyr80BH/vNJMDuK6CSlJ1Gb07l9/A=; b=Lu1TrltLnT1ykkSpllh8oCc6/e
	/XdiZg7ZpLEYHiLI5kTN+gnxntymg5TbleYGfmp8MYq6qw66TCNb5xKsXQxKWvmgyIiUF5b3JI1cB
	vyuDnlAZG4TNy+HHSq/wScb+Pvd0dhNt6NHB0IRjusUexUfu6dlwEK0KuzXYmzj8Gt/D2uH2zjA0O
	TNrHgg3y8dDv9oEBMxpXxlVaPAZ5Pn0P38wv+VX6O6OznW2JBk0IMmTnRTCcne0t4Q2x48gh5xYMR
	zRyKnkjnh4jnoYm+PthcNnYrzmPSVnrhIPPjpAnZLmOnkhoLwK9GAGVR10odLFaJ/HejBjuLzATOZ
	T1tJQzhg==;
Received: from localhost ([::1]:58656 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1id7Xb-006N7j-Pn; Fri, 06 Dec 2019 06:56:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:53876) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1id7XV-006N7c-DS
 for samba-technical@lists.samba.org; Fri, 06 Dec 2019 06:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=WtSA8aFQZKcqELkyr80BH/vNJMDuK6CSlJ1Gb07l9/A=; b=NRd4PrA9k5visnT/Rs1ob+EGqJ
 UrFE0OPjydgs7caZ4l240gLNJ+B/7vN98ajRzS0CZS9xUiLmNfAQVosM771RXWMWrjTAka7j8gsXt
 Iutnee3n8NuiB7VLf2C7gBVdlSEKary0Sqdpx4Z77XXPtYi1RFiy85Qsvdhq5qOu90UpdV3g/cODW
 qUvLooTixPecjDby5Q0A/xo/JiJO7JVw0HJmOcvuzjWhbw+BdedKKnURGIUZCa1onHZD44Zw6i08U
 8ALUbZMehiZVH+OWg2RDyaTTp/p3HXEc8i/EnJPfdfjTzKH0AK4K3Qis269ANjMSt1GIYl5c78g73
 5knE4mGRm6ykVq1r83vCrOsKNozkkqhlGm6rhiu0Bv/Gx/eKWDbVdBEDCSKtKizwt4iq5/AApH9hK
 LHM7e/X8n14X3ppEz/MWD0p0Q2OBBf+/iOPwsq8BQmKkLPfCmn7mqePcDOg72re8XC6JTwG6IfSID
 S0abABsLznLZttNGSW4Jp/UX;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1id7XU-0005Ab-RF; Fri, 06 Dec 2019 06:56:32 +0000
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
Subject: Re: Automating usage of smbspool_krb5_wrapper
Date: Fri, 06 Dec 2019 07:56:32 +0100
Message-ID: <3908966.9OaNKuxUIl@magrathea>
In-Reply-To: <c5977820-2814-183b-d29b-01fab733a995@rosalinux.ru>
References: <af8412ee-5493-0406-e95b-8d3175ec069a@rosalinux.ru>
 <3533791.v9fxMDVjKa@magrathea>
 <c5977820-2814-183b-d29b-01fab733a995@rosalinux.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Friday, 6 December 2019 07:36:50 CET Mikhail Novosyolov wrote:
> 06.12.2019 09:30, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Thursday, 5 December 2019 22:27:59 CET Mikhail Novosyolov wrote:
> >> 26.11.2019 19:20, Andreas Schneider =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Tuesday, 26 November 2019 00:49:08 CET Mikhail Novosyolov via samb=
a-
> >>>=20
> >>>> I have tested those 4 patches (2 yours, Andreas, and 2 mine that I s=
ent
> >>>> here previously). Behaviour of /usr/lib/cups/backend/smb symlinked to
> >>>> patched smbspool_krb5_wrapper seems to be correct: it passes printing
> >>>> tasks from printers without "AuthInfoRequired negotiate" directly to
> >>>> smbspool and correctly finds /tmp/krb5cc_$UID for printers with
> >>>> "AuthInfoRequired negotiate", where UID is a local ID of a domain us=
er.
> >>>> I clearly see this in /var/log/cups/error_log when it is "LogLevel
> >>>> debug2" in /etc/cups/cupsd.conf.
> >>>>=20
> >>>> So, these patches are ready to be merged, I think.
> >>>=20
> >>> I'm not able to apply your patches. Could you please send patches
> >>> created
> >>> with 'git format-patch' or point me to a git repo where I could pick
> >>> them?
> >>=20
> >> Hello Andreas,
> >> I have recently read how it is recommended to send patches to Linux
> >> kernel
> >> and it is recommended to send them as plain text, not as attachments, =
so
> >> I'm resending them as plain text emails in the following emails.
> >=20
> > For samba we prefer one attachment as a patchset or a merge request.
>=20
> Ok, thanks.
>=20
> > I opened one here:
> >=20
> > https://gitlab.com/samba-team/samba/merge_requests/961
>=20
> Why are you sure that the root user cannot print using Kerberos
> authorization? There should be no problem to get a kerberos ticket from
> root and sometimes it can be needed, for example if system-config-printer
> GTK+ GUI is run from root via consolekit or if a crappy proprietary
> applications works from root and requires printing.

If we are root and have a valid kerberos ticket and we want to print a doc,=
=20
there is no need to do any uid changing and trying to find the credential=20
cache. We should just call smbspool directly.

Rembember: smbspool_krb5_wrapper is there to switch to the uid of the user=
=20
printing the document, so that we get access to the krb5 credential cache. =
If=20
we're already root:

a) we already are the right user
b) we have access to the krb5 credential cache

=2D-=20
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



