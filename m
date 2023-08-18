Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 40285780269
	for <lists+samba-technical@lfdr.de>; Fri, 18 Aug 2023 02:08:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=9EQTInzhGzkQg2gV2vAbRccS1EKFkjoxtmeEGUpHzcE=; b=D303ZxSIucw/QV+HdovAFQ7Ghc
	KvdSIIePaBjm7nHrOZvCobaVt5RIqsEKenyBSM7stFP442BUIZfNxkoftXpPVqOl51g9yZeDKbPQP
	Yhkm20rgF3/GnTm0kwS+ONCXs18uYKcHi1DviJWQITdgils8ktPfWuWL0lmsPUkbXE2acHYtM9gFN
	kcINvx0nOlNgkJaobLZW3JV/Y25f5GjRTILsVmWiPjRaZtSc1+xYNFiKk8YkHAwN+/tq9dxQYB5ic
	l39cXo94LUfhaReEy0KftQg29p29hvUF1Np4DXYNJGUf3w68hfERUDQGdHDr7Ys7dCws+ihrh3X1V
	EF+sQ0jw==;
Received: from ip6-localhost ([::1]:57818 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qWn2D-00CyJJ-A9; Fri, 18 Aug 2023 00:08:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:14066) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qWn26-00CyJ9-BH
 for samba-technical@lists.samba.org; Fri, 18 Aug 2023 00:08:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=OyivDiEj9ZlFwYS1BA6mNkYjNtzBZXhZCAmS4Vmo3R0=; b=yocjN7/cDQ7caYAgbQWq94yakO
 euc5hQR/JpaqVS0cBtj3f7oKqTC6tZgRcdJD8SwVok228uKapoS579WeeH3bpZUQ+MSnbZnbzv/de
 /+5IfpPXytYPYAR+brMvfTa7DXxSPgpZN+57g8O2aI/0nWXeviAF81sddo78IQtA63ClVdkoKHAcH
 4vXSJZHql+9vcOC4emKrz10/3eaFyHMBRSAZxvg6cTF56sX6DEJiJ+nCE9CGQxuSLLuOLPTCfOmFY
 PZA+veNzUikRUgXZhMRDRFg5+1HrA2wu0xs6Ld0kCjO4nzg1Y9WEOG4uES/5hP3K19ODyn4r+uSJ4
 aQro+IGqp3Ditq7VPEcD3RPiohQ6le8cAUBgCNaFhfYnpFp8ERhTzfyhuaugZIRuFK5M5b6IrqE2J
 08lRMbKnYChlx37S+08DdSVp/1PTleDfwI0T+bIa8MLvu57QoQ8MVn1EJHpDyqI6MFG4/fUA5kUlY
 hf+2jP3jlakiAdgi39D/eFx5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qWn24-008f40-0w; Fri, 18 Aug 2023 00:08:04 +0000
Message-ID: <c1da83c30cca9c9e0d85fa6b1dbdd52e014ca918.camel@samba.org>
Subject: Re: Drop RHEL 7 / CentOS 7 support and move to Python 3.8 minimum?
To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>, Upstream Samba
 Technical Mailing list <samba-technical@lists.samba.org>
Date: Fri, 18 Aug 2023 12:08:00 +1200
In-Reply-To: <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
References: <6725d25bf9dbbfebd0b1ad248fc6b397f89165c8.camel@samba.org>
 <4db84791-6dbc-4f8e-f1d7-7582451d19c4@catalyst.net.nz>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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

On Fri, 2023-08-18 at 11:52 +1200, Douglas Bagnall wrote:
> On 18/08/23 11:20, Andrew Bartlett via samba-technical wrote:
> > We need to reduce our CI time, and one way to do that is to
> > reuseobjects as much as possible, creating read-only objects once
> > per class,not per test.
> > This is much cleaner if with the addCleanup() and
> > addClassCleanup()methods, so I would like to be able to do that.
> > To do that we need Python 3.8.  The primary blocker for this is
> > theCentOS 7 build which uses Python 3.6 from EPEL, and a newer
> > Python isnot in that repo.
> 
> I had a look at the Python 3.8 git history for Lib/unittest to see if
> it would be simple to backport/recreate the ClassCleanup code into
> our TestCase wrappers (like we used to do for various assert
> methods), and the answer is NO. Thankfully.
> I have no opinions about Centos 7, but I do agree that the supported
> Python versions need to be exactly determined by CI.
> Douglas

I would note that times when we didn't line up the CI version and
Python 'supported' version, it kept breaking. 
I note that RHEL7 ends 'maintenance' in June 2024, just after the 4.20
release March 2024
https://www.redhat.com/en/blog/end-maintenance-red-hat-enterprise-linux-7-almost-here
Those dates I think give good cause to drop CentOS 7, but other views
still welcome.
Andrew,

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead                https://catalyst.net.nz/services/sambaCatalyst.Net Ltd
Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company
Samba Development and Support: https://catalyst.net.nz/services/samba
Catalyst IT - Expert Open Source Solutions
