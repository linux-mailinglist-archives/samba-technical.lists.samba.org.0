Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E5652526870
	for <lists+samba-technical@lfdr.de>; Fri, 13 May 2022 19:27:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HQ0XbfolItntYNIeICjMb9D6Vx+OVhI/Yx0aYrVgIZ4=; b=Ao0AAoXAOsBMWpid39yPV5KKLK
	sl25iZ5WcZkcCFsswfARvi4ECxYgeelbFvPl801g+wWycRI/xXRsr0V1s4AWS0egFYm39aYM2yBe4
	Rpd4SwXJEuJYZbs1+xsFde3ZUClB+VJZa2r3qbluk3LG0VPvaVSSUITZXFp07QrR3Uxm3aD+Ra1/L
	5r++r/BYewa7mYAdiPrnypdqd6BITW1SlDKWMZdH/3frsjkUBEKG8sHlPS04teKF20h715sKwi5Z9
	Z1SZqfuJ01iK+j7aGU1vl7Qq+mCaWxN8gqskO4g6HOUq8gDxd7M6PufiGKi8/to2c+ROIK5ZBy+Qc
	uGMX1OHg==;
Received: from ip6-localhost ([::1]:56696 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1npZ3p-001GG7-W3; Fri, 13 May 2022 17:26:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61580) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1npZ3l-001GFy-7x
 for samba-technical@lists.samba.org; Fri, 13 May 2022 17:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=HQ0XbfolItntYNIeICjMb9D6Vx+OVhI/Yx0aYrVgIZ4=; b=Vrp61/lCoKhc3FjMRnMikNo3Is
 9RDJCwz43knyGqavKmny0OP+npGedUa8mjkHaKn/wOzzcf0NjucnYJnTTzstz2mylyCgofEfqJOpt
 rvgSRXtCntbxr29EJdhrsJkZCBEOBJDxlorV3J9QbGgGz4DvyAvvmowAEe+JnJ0VJ0BdsQrz+6ZLW
 a4dervca9HS3juW+XCg/8E8jRc1zNeXjrEmZ7ZymudQzLbTmhYM/vTEyHulocoLdoIFXIo8wHeNdR
 hUxt2G5wlMZy5KXHQ09hv+zUdOEvCNjv0dwPnAanN2CZNkvrxyoZPcNGPIAn9QX49OzAan6D6aymb
 c6CmjsuFdD3X86cgGahFCFjR1fnC1b+Ro9aRYCDWLCJiStJCleF0g9CXSG/x3ApTkZfpqtCG11hDM
 4Z62KLOTiNHcjQX1MKApukIVDH6FoME82hg2NneEqQ7bZuUbw4Pf2OSoS8SudKK99DOUOr5Yn3i7d
 6uu3Kwl4KgGoyG4AC/LH1AWg;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1npZ3j-000mKY-QU; Fri, 13 May 2022 17:26:36 +0000
Date: Fri, 13 May 2022 10:26:31 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: A blog about my "Dollar Ticket" attack (Nov 2021 security issue)
Message-ID: <Yn6Ux//PiDHPfCoD@jeremy-acer>
References: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <527f79427e6de47e8e367596ebf4795dcbb16e36.camel@samba.org>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 13, 2022 at 06:22:17PM +1200, Andrew Bartlett via samba-technical wrote:
>I wrote up
>https://www.catalyst.net.nz/blog/stay-curious-lessons-doller-ticket-security-issue
>to explain a bit of how we got to the big Nov 2021 security issue.
>
>I do want to say again a really big thanks to everyone who stepped up
>to help us in the rush up to November last year.
>
>Also, here is the puff-piece we wrote up regarding finding the issue
>https://www.catalyst.net.nz/blog/catalyst-samba-team-fixes-critical-microsoft-security-issue
>
>Oh, and one last thing:
>
>https://msrc.microsoft.com/update-guide/vulnerability/CVE-2022-26931
>
>is credited to me.  Fun times!  MS hasn't put as much detail out on
>that one, but I'll talk more once that is public.

Congratulations Andrew and the Catalyst Samba Team members.

Great write up !

