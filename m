Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DB6215299
	for <lists+samba-technical@lfdr.de>; Mon,  6 Jul 2020 08:20:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=XFHLYzu+YY3KTeH6QhfttueaKhoCvRNiI+eU5BSXQ3s=; b=eMfWqT9GkBc1+J+HxZvzE+NgKV
	GDRcxbXO/+32lkDXhHQTz9FS3Pd1TcA6ukV/CKDaNM7+eaByrGQIRfgwTv855E49gOCq3wfIb63ul
	bayK4Mu613Yzz5gxJHqwzg6t088ex9PsWaiTbHc0ayJDGURbeFXtM7v73zihOG2FK/+rF7ficZvH5
	M+bZC2Swp/Kx2yKLrAWCA/fVA5e72PSg4KfsFWXsgoEKQM8LlNcfzg/n0rfGWBtEEymJL9b3mnuid
	p7sFoCskeMTU+Wip2YMGdPlwQZkcGXLidcCfdzSKjvAl1sHRC3CEBYdSEed3v4QKluqNOTF5sE1AE
	EfkFYKjA==;
Received: from localhost ([::1]:53462 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jsKTr-005eoK-CU; Mon, 06 Jul 2020 06:19:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12006) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsKTk-005eoD-W0
 for samba-technical@lists.samba.org; Mon, 06 Jul 2020 06:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=XFHLYzu+YY3KTeH6QhfttueaKhoCvRNiI+eU5BSXQ3s=; b=qZXaQIF8Wq9NtMxAo55sWCbAMQ
 QGkQkgOpm08AXzGNsuuOM9mwJ9dx5YflpdADYLE8tVKj0QfEYbxWgL8K6+HLim+CFqvI1KS2Dds1Q
 RfJu98c8GaZgTK1LzMTF/U+ahsoV5QyxdgESFR2BKSp1QtF1qNTe+Qo197uMzP7xeaU3PfyXkn3K9
 5ERtJi1e6Gj2WCBDE/z8BtDu73nYWIdQVCOKfiK1OnKbAPPXXJFa4FheiLotgbgNsGL1lxlYD8vF9
 B8Q4LMRQrDLCeF7B6IESbkl2fSEwoZN9XjtF25FatvtZpfmMV4w8xCXKFhTexj9dCUIMOdpNz85HT
 yVbDRKm8c9XT0m2C3tSgsoSoQVw5lDeS8T45K668b1XymvKLsi0GXiL4TgYZUlhe+sHb1h/z8KbFV
 p3PRcpC8YuPuYBgKHRRq2pOgwSszNcjGioQZ+o676s3nqvYa1+edrbN5SkA3GerPbgbLd9/6l1YEP
 Ep6NX7Dlsg8bW5pey3Lb9sNb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jsKTj-0006XA-M0; Mon, 06 Jul 2020 06:19:47 +0000
Date: Mon, 6 Jul 2020 09:19:45 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>,
 samba-technical@lists.samba.org, David Disseldorp <ddiss@samba.org>,
 "abartlet@samba.org" <abartlet@samba.org>
Subject: Re: GSoC Update and Phase One Feedback
Message-ID: <20200706061945.GC25598@pinega.vda.li>
References: <CAH72RCUABcQkZ3yyWzATYi0ZeUTsLGGi90Kbk7ySAY6Z-BZSJg@mail.gmail.com>
 <20200704170227.GA866108@pinega.vda.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200704170227.GA866108@pinega.vda.li>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On la, 04 heinä 2020, Alexander Bokovoy via samba-technical wrote:
> > I have decided to work with the Open Build Service, from the recommendation
> > made by Alexander, to build the packages for various distributions. I was
> > making the assumption that the most popular distributions used with Samba
> > AD DC are RPM and Debian based. I'm seeking the community's feedback so as
> > not to make the wrong assumptions on this.
> > I created an account with the build.opensuse.org and have been exploring
> > the UI and going through the documentation for OBS. I also created a
> > Webhook in Gitlab to push the code to build.opensuse.org when there is a
> > commit in the master branch. Is this the right way to do it or is there
> > another option?
> 
> This sounds great -- we can start with RPMs as the spec file is already
> there from the Cockpit starter kit and it works, so it should be
> possible to instruct OBS to build RPM packages already. For Debian
> packages, I'll look tomorrow for an example (Cockpit is available for
> Debian, so we shouldn't have a problem to find an example for external
> plugin package build).

For Debian packaging, I found this very simple tutorial:
https://tribaal.io/very-simple-debian-package.html

And then there is a special helper that allows to add Debian packaging
to a nodejs app: https://github.com/heartsucker/node-deb

The latter is not exactly what is needed because it is tilted towards
actual applications, not plugins like we have, but it should help
started with a boiler plate. 

Cockpit itself builds a tarball for javascript-related stuff 
and then simply installs its content into the expected locations.

Andrew, can you please help with the Debian packaging?

-- 
/ Alexander Bokovoy

