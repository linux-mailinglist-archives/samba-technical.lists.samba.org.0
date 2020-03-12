Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E3D1828F1
	for <lists+samba-technical@lfdr.de>; Thu, 12 Mar 2020 07:26:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=Bzxispl+lJEjI8FMs+X4lqCUiSpVRrBWekD4Z2vOkC4=; b=ywyC5akx+vAX1W/fS3rnguxMSz
	XuxAzsZzcA40MQbs202tOi1rtw1r9SfV4GuxbFTPhblS4Wrl3RNqldKgX5c/IVLZ8OjWqyNY4vHD/
	CTZuobuXYPPJtSCAmKxq6bo8a9DKHIQtxbDFM+ROKbIWfYbBWLFoPEcGBtbUDTy8Kb6kXSjMdgpwo
	Pk9AgHhIrU3J/dum44PXMHKupAo2vmw6bHpTH2jcdpm7fiBsZ+4706925/6TX57+UQEVDwoLy+aOz
	pfDlcp+zeNeSNWJEJxU6GszBTnCFvys6Of3k4sy0qxrngYUmy0SIC65VO1tWMYkrozeo34tnMmQga
	CAGbooCw==;
Received: from ip6-localhost ([::1]:35778 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jCHHK-00FtOC-MI; Thu, 12 Mar 2020 06:25:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16946) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCHHD-00FtMp-47
 for samba-technical@lists.samba.org; Thu, 12 Mar 2020 06:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=Bzxispl+lJEjI8FMs+X4lqCUiSpVRrBWekD4Z2vOkC4=; b=cO0Z/UHpZ1Pv1I41z1sNJwATXL
 t5AAamSnMOUYbHjKzF1TA0AMHOBb1We9CRfZOGKd3apFTWI7KAR/F4sPpn8f4qoWuh+EY7BmSZyLu
 nUUz9Wkoq8/5W6hOJw86OOZy4nH6oOOKBXT61sGQfesUggKdEROkByjJ7lZkO0S6SXwD3J8sVaIfT
 2hJjUvstmxKBr3Cpv78DOc+TJnQ4uebpok30rkCTgPkOZpZCL5A73mV2kWi0EiURKhc+vm+RcjepY
 gNfk/GnVM4FZoMkTRA50XjmGskQNQ3UCucxH9TfDPnOUtpaoXxkYyU1h9Ym2AKjr/0OrCM8+y32Mo
 ZG2K8aq6pbNtiTBoy1E9bfB9qfExxwFEc2evDMGty4Ht18HvQZYTG1x1CR1J5MoMTnmIqJF1PGMyA
 tAvtPBT0+yV6IJkUEKYPMHSJfAnNXNHZfRBG03cSf3u1JVZDaidOUs4GMhZ9X09xCLVCvGaEHKQzZ
 AiqyxDNi4g65N0P0HY0xBrZW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jCHHA-0002Lf-RZ; Thu, 12 Mar 2020 06:25:00 +0000
To: Andrew Bartlett <abartlet@samba.org>, William Brown <wbrown@suse.de>
Subject: Re: Retire Fedora 29 / OpenSUSE 15.0 from CI?
Date: Thu, 12 Mar 2020 07:24:59 +0100
Message-ID: <38643263.Z8vMgeSRLk@magrathea>
In-Reply-To: <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
References: <7999f917f76d922dfd725d185903fdf47e1a7e9b.camel@samba.org>
 <E8F6741C-BEC9-43A6-B683-E21BD9F61372@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: ab@samba.org,
 Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 12 March 2020 04:40:47 CET William Brown wrote:
> > On 12 Mar 2020, at 13:17, Andrew Bartlett via samba-technical
> > <samba-technical@lists.samba.org> wrote:
> > 
> > G'Day Andreas and the list,
> > 
> > It bothers me a little that for every Samba change we make we spin up
> > 37 builds on 37 VMs.  It feels a little excessive, and while CI is
> > awesome when it saves us all time we should also use the earth and
> > Samba Team's resources carefully.  (Even jobs aimed at the 'free' CI
> > can be run on our servers if GitLab.com's servers are busy, and the
> > planet pays either way).
> > 
> > Therefore I wondered if we should also stop running CI on Fedora 29 and
> > OpenSUSE 15.0, both of which are now it is EOL upstream?
> > 
> > Both went EOL in Nov/Dec 2019.
> > 
> > In the future I think we should set policy to only CI on (some, subject
> > to other constraints) supported distributions.
> > 
> > What do folks think?
> 
> This sounds like a 100% reasonable policy to only run CI on active/supported
> distributions. :)

Yes, we can drop them.

I think we can also just run the latest Fedora version (two versions when a 
new release comes out for a few days). We have CentOS which provide old enough 
distros to show we still run on that stuff.


Alexander, what do you think?


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



