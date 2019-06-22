Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159A4F3B4
	for <lists+samba-technical@lfdr.de>; Sat, 22 Jun 2019 06:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=iS1ZGpBwKPp81BYsKgWBhUKLodh9XaHkZo4ejGFDvjY=; b=2bY9elPD/dtqKMFegYGbjoAofl
	qC7r2LQVkah1oW9Pvs6vDPcDLWkWsNZBQwXldLgV0sWmHey65xRNPTeO7arqGZ44+sAyMAdfjcFdf
	Epar5nEzcrucstZd0PLf+Z9F2YAN/K9awKBNUj1qwqWCMin8fX1XUbWJvwmNI8DGHjipt3/2GwADB
	GocqPbGOSHyW1k4loh+obzmJMlPa6lv8E8oEVNw0F20a5AY7jxRqpN6SW+0oTsKI+FXCINE4iIYxe
	EU56vd+mUoWfbAb3sGCl5BQU7vcQjD6wIzSZaCj2DKbGSemj3NIelb9xwTUcAQLX+DJbd/66CLdBE
	9iol+UOw==;
Received: from localhost ([::1]:45204 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1heXg6-0015sg-Nv; Sat, 22 Jun 2019 04:31:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35820) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heXg3-0015sZ-5I
 for samba-technical@lists.samba.org; Sat, 22 Jun 2019 04:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=iS1ZGpBwKPp81BYsKgWBhUKLodh9XaHkZo4ejGFDvjY=; b=JUKn3XXjj+vlQBpP9nmxFjTcxe
 0xA4egCbVBx1dLkWH+6vwAmDwrj/oMZIRay999+3RgBLhGEFb9rB+XYihlRJv2z2PrcTNQKgx7Lah
 HaEWshlIaNGy/0O6IZaYPoIICXi4l0Ekj9RuDmCfSht86lpSdGKUO72Iu0isPc/M7HFs=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1heXg2-0004bn-2C; Sat, 22 Jun 2019 04:30:58 +0000
Subject: Re: Document GitLab as the only way to contribute to Samba?
To: Andrew Bartlett <abartlet@samba.org>, samba-technical@lists.samba.org
References: <1561079117.28284.21.camel@samba.org>
Openpgp: preference=signencrypt
Message-ID: <1335d0cf-bb13-6fcc-a4ea-75e6d4345cf5@samba.org>
Date: Sat, 22 Jun 2019 07:30:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561079117.28284.21.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
From: Uri Simchoni via samba-technical <samba-technical@lists.samba.org>
Reply-To: Uri Simchoni <uri@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/21/19 4:05 AM, Andrew Bartlett via samba-technical wrote:
> G'Day all,
> 
> I gave a talk at SambaXP about our first year with GitLab, and one
> point I made is that it is *not OK* to have public contribution
> documentation that does not match our actual practice.
> 
> I was talking about GitHub, which we advertised but did not embrace
> (and which by the end caused new contributors to be told off,
> essentially).
> 
> I've recently found myself doing the same thing!  But now I'm berating
> contributors who follow our public documentation and so innocently send
> patches to samba-technical, or attach them to bugzilla. 
> 
> So, I would like to propose this.  That given the practice of the Samba
> Team and almost all contributors is to contribute via a merge request
> against https://gitlab.com/samba-team/samba that we document this, and
> only this, as how to contribute to new patches to Samba.
> 
> This is only one tiny step in a process to have clear, practical
> contribution instructions, but I would like to ensure we agree on this
> much.
> 
> Essentially it would mean a better version of this being prominently
> placed:
> 
> https://wiki.samba.org/index.php/Samba_CI_on_gitlab#Creating_a_merge_request
> 
> and updates to:
> https://wiki.samba.org/index.php/Using_Git_for_Samba_Development
> 
> Non patch, meta and broader architectural discussions still belong on
> samba-technical of course. 
> 
> Any thoughts?
> 
> Andrew Bartlett
> 

Speaking for myself, this thread brought to my attention that Samba
development is no longer happening on samba-technical mailing list. I'm
all for gitlab, but had the notion that you post an MR *and* write to
samba-technical, which was certainly true 6 months ago. By moving to
Gitlab without proper notification you've lost me as a reviewer (and I
do make occasional reviews in places where I was involved). I'll take
the proper measures to get back on-board :)

So a clear statement *is* in order.

A bit off-topic, and maybe the following concern has been raised and
answered. My gitlab experience is a bit dated so maybe things have
changed, but it seems to me that the mailing-list style of review keeps
a better track of the decision process that led to the way the code is
(and I for one used the samba-technical mail archive more than once for
that purpose):
a. With online tools, a revised MR may trump the comments made by the
previous version.
b. How to find the MR from a commit hash to see those comments.
c. All this information (MR comments) is kept outside our control and
may not be available should we decide to move away from Gitlab as a
hosting platform.

Thanks,
Uri.

