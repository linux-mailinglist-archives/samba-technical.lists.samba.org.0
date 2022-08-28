Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9F5A3DE7
	for <lists+samba-technical@lfdr.de>; Sun, 28 Aug 2022 15:58:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=AQ8C7b+thH0mpwbCH/TBEOtrOwu4gl0fivWfD8OCDSo=; b=mjS0RGphS+y4e8AfETIOPdgUne
	DuNyYROrBjYaRKmRTh532YqK6eNzLdR8jlFslFmiCRqD5NNqY+b8TxLxMpcAMKEn4cvG+qyqEpX4K
	hTaL0W1zL+UMaAfo5x5/BLyl01LeNLQFF9nhQ6sHtXg4eDJF6uyDDIo/iUoa/0LX+azKmmp4nCkQW
	7g8DLzGUeUbpwbmsi/WX8fEC+bM6sFZB/e6BZEmnPqe6yse4uZ99wB0JmJkJjpNkci0I6fA2lriLd
	XVOVTa5XJJrR7ck30Qmrbr+udhcj4wuy26GeibEtvhGCoMQd6xOikyuIIbPmEceHSVZHyBZTvqIR3
	MeyDsA3Q==;
Received: from ip6-localhost ([::1]:23274 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSIn4-002lFZ-EJ; Sun, 28 Aug 2022 13:57:30 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38158) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSIn0-002lFQ-0U
 for samba-technical@lists.samba.org; Sun, 28 Aug 2022 13:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=AQ8C7b+thH0mpwbCH/TBEOtrOwu4gl0fivWfD8OCDSo=; b=pQJ5ztIvNoKROWl/Rr+uExZsnV
 6g1bt1AGglbQUEd8mu0IZ0DTiI7YZoxKZnuDVma2HNO1IadaIkFBoUZ2rrY/P/joEbtSFcHx7tNqk
 nZNrUHn3TPc0R3Y5/pke+BrnW/0uCV4yoboERNA5kMaHDzJFRXgIpnnIdNc1p9UCGbTaoHmDcUWgS
 kckgz66gGO+FGJSLGLmvO7tpaGU+8i11y8+5j1cyDABSFcebZQAij5hEHm/K77mL6iqxV7LlMJ9vw
 bVIXWvbmllH2mtVf5HEjaxVDpFRsdcHJq93tfDOe0RjtvCpCbCKghgnGiy6aB1tfRrWTIBAZCNDZM
 yOUU8dkE/zLbX7IF5f48SOZi8aqBBblqOieKfbmMC2Q+8f7ql2pbPcWzAmFuaHtrbqNEPL6kwOLy+
 T4V4z772X1ZVVFIAPHTIupmu4J6Ofl3r1J6aprRyz2zAYEGLOSm5Qq16WzLRLXmNA5O5BfgOQdo3C
 xlkLeihOF4LKdxQBZJa40Y75;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oSImz-00265W-8z
 for samba-technical@lists.samba.org; Sun, 28 Aug 2022 13:57:25 +0000
Message-ID: <a1011fbdde1c46ad943ff336904bb4ad990de902.camel@samba.org>
Subject: Re: Phantom samba-tool option
To: samba-technical <samba-technical@lists.samba.org>
Date: Sun, 28 Aug 2022 14:57:24 +0100
In-Reply-To: <Ywj87hCJ2MG7l5IS@jeremy-acer>
References: <e3eeb1eda243c5cd80260add048423173c2b0b32.camel@samba.org>
 <Ywj87hCJ2MG7l5IS@jeremy-acer>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
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
From: Rowland Penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical <samba-technical@lists.samba.org>
Cc: Rowland Penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 2022-08-26 at 10:03 -0700, Jeremy Allison wrote:
> On Fri, Aug 26, 2022 at 09:19:58AM +0100, Rowland Penny wrote:
> > Hi Jeremy, a user on the samba mailing list asked about the '-A'
> > option
> > for samba-tool, an option I had never heard of. It is shown in the
> > samba-tool manpage:
> > 
> >       -U|--user=[DOMAIN\]USERNAME[%PASSWORD]
> >           Sets the SMB username or username and password.
> > 
> >           If %PASSWORD is not specified, the user will be prompted.
> > The client will first check the USER environment
> >           variable (which is also permitted to also contain the
> > password seperated by a %), then the LOGNAME variable (which
> >           is not permitted to contain a password) and if either
> > exists, the value is used. If these environmental variables
> >           are not found, the username found in a Kerberos
> > Credentials
> > cache may be used.
> > 
> >           A third option is to use a credentials file which
> > contains
> > the plaintext of the username and password. This option
> >           is mainly provided for scripts where the admin does not
> > wish
> > to pass the credentials on the command line or via
> >           environment variables. If this method is used, make
> > certain
> > that the permissions on the file restrict access from
> >           unwanted users. See the -A for more details.
> > 
> >           Be cautious about including passwords in scripts or
> > passing
> > user-supplied values onto the command line. For
> >           security it is better to let the Samba client tool ask
> > for
> > the password if needed, or obtain the password once
> >           with kinit.
> > 
> >           While Samba will attempt to scrub the password from the
> > process title (as seen in ps), this is after startup and
> >           so is subject to a race.
> > 
> > The only problem is that the '-A' option does not exist for samba-
> > tool,
> > it is a smbclient option.
> > 
> > I traced it down to it coming from docs-
> > xml/build/DTD/samba.entities,
> > but I cannot see how I stop the samba-tool manpage from using it
> > without totally removing the relevant paragraph, which will (I
> > presume)
> > remove it from the smbclient manpage. Can you suggest how this can
> > be
> > done, or should I open a bug report ?
> 
> This comes from : cmdline.common.credentials.user
> which is included in:
> 
> manpages/samba-tool.8.xml
> 
> '-A' is described in cmdline.common.credentials.authenticationfile
> 
> which isn't included in:
> 
> manpages/samba-tool.8.xml
> 
> So the problem is the '-A' text:
> 
> ------------------------------------------------------------
> "A third option is to use a credentials file which contains
> the plaintext of the username and password. This option
> is mainly provided for scripts where the admin does not wish
> to pass the credentials on the command line or via
> environment variables. If this method is used, make certain
> that the permissions on the file restrict access from
> unwanted users. See the -A for more details.
> 
> Be cautious about including passwords in scripts or passing
> user-supplied values onto the command line. For
> security it is better to let the Samba client tool ask for
> the password if needed, or obtain the password once
> with kinit.
> 
> While Samba will attempt to scrub the password from the
> process title (as seen in ps), this is after startup and
> so is subject to a race."
> ------------------------------------------------------------
> 
> So I think maybe we need to duplicate this section without
> the -A text as a new ENTITY cmdline.samba-tool.credentials.user
> and include that inside manpages/samba-tool.8.xml instead of
> cmdline.common.credentials.user.
> 
> I'm CC:ing this to samba-technical for opinions from the
> rest of the Team, and I also think you should log a bug
> so we can track it.
> 
> Thanks ! Jeremy.

So after Ralph posted his latest post about gitlab, I browsed the open
MR's on the Samba gitlab and found this:
https://gitlab.com/samba-team/samba/-/merge_requests/2468

Now this would give samba-tool the missing '-A', but I do not see the
need for it. It seems to be meant to stop entering the password on the
command line during a domain join and sending it over the wire. This is
something that can be done by running kinit and then 'net ads join --
use-kerberos=required'. Using kerberos would mean that the plaintext
password would never leave the computer, which I believe is better than
using a credentials file.

Rowland



