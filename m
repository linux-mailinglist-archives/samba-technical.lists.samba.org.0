Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAB31C5242
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 11:58:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=8jmTL08ed5jjDlKYrMnRkN/9AyrtaIpRyrirW5uUvM8=; b=nnuugXAnfQZlZqsXVSsRnBzmY/
	0uIf+22rUac8oI6fpdbfZ5IQN0G5YAW/Pa0QkO/UzdW61gZN4M1NNUNednhYtMqOAAwFQ1dZyGEeP
	ELWW+7iIK5NIsAnPsvJ1Xyr8qwfXRiQxW/iDoM5RO4RXfe5KngtxGL1gOlayxTHVpku2F9jPQb3eZ
	xHU2Snb3A7ijMnmaxN61wxnvLtnlDh2pVfyJyVkcOjK686DarCw6fXewTYdY0ekaIWPCUge9pBh6V
	SmeYLDdNwWc3lUb1E32BUzBkGbMkCeI3GbgcwtD4SLlNayQ5Pkx08aWTe5V2Bgew3mz2Bjw2RSmMg
	bywkjEKg==;
Received: from localhost ([::1]:61414 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVuKT-002lNW-Ik; Tue, 05 May 2020 09:57:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:23332) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuKL-002lNP-MK
 for samba-technical@lists.samba.org; Tue, 05 May 2020 09:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=8jmTL08ed5jjDlKYrMnRkN/9AyrtaIpRyrirW5uUvM8=; b=WffP7EtCPH5uWB/2nnEALy9zlg
 qVXnKTuhBOMDg+DI09AXq1sxfOA+osVQhW0WYDJD4iyWH0OsWQ5K4glouoqC4mXvIkp+TBDnzzebn
 Z+kMEOGK5MXZl5vcsnf+sezybKPhU7zs4Lxm8SJ54wU7u9OIP8EceJvoqIkOR7wjA/VxyELmSAs0T
 KwEIn9vbMmF1aHLXXi5w+xsjADnRLTaiuRgaZNYCLbJrKebfhGTwQpypa3mWhQG5zT4205Y7Niyok
 RDyLC6yWPTgNHwHck86z/h3NPAILPAo+vm5ts0/lX4a0ALTULSpNyel4t5ejSwJKLfoF/uwF1YyoU
 fDEIV08MF8RCkdnAQlYgfxPMI+Oa+NW06uFBGuYaQ/+EIRdGJuRC4oa+gqk/X56G3gnkedEvYeady
 3LqFfPdbSxyNcWw+AW1Di6cGEo4Qv9YT1xqLzYX3dC/k/j88FqxRl4Y1Xv0UhIRM/QYrTVeKdtEG3
 0aLxzzOSayhuZKuJd+VgmRll;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVuKL-000191-BQ
 for samba-technical@lists.samba.org; Tue, 05 May 2020 09:57:25 +0000
Subject: Re: [PATCH] Remove 'samba-tool user add'
To: samba-technical@lists.samba.org
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
 <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
Organization: Samba Team
Message-ID: <a0eaf57c-1731-2a25-82ab-9d76d73b8380@samba.org>
Date: Tue, 5 May 2020 11:57:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Björn,

Am 30.04.20 um 12:07 schrieb Björn Baumbach via samba-technical:
>>> Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
>>> wrote:
>>>> Can someone remind me why it was deprecated?
> 
> On 3/29/17 3:04 PM, Volker Lendecke via samba-technical wrote:
>> Also, shouldn't we align this with the group commands? There we have a
>> "samba-tool group add", but no "samba-tool group create".
> 
> Hi!
> 
> I would like to continue this proposal and like to read your ideas to
> resolve this.
> 
> I've recently opened a merge request with a set of patches which rename
> the "samba-tool group add" command to "samba-tool group create" and
> deprecated the add:
> https://gitlab.com/samba-team/samba/-/merge_requests/1304
> 
> I planned to fix all other "add" subcommands, but I've noticed that most
> of the subcommands like computer, contact, ou, ... use "create" already.
> 
> In addition to the "group add" command there are two further "add"s
> left, but they make really sense, in my opinion. It's "spn add" to add a
> SPN to an account (while the command description says "add - *Create* a
> new spn") and "dns add" to add a DNS record.
> 
> I think the "add" command is generally more comfortable and seems to be
> more natural, even for adding new users or groups to the AD.
> 
> It seems that several people wonder why the "user add" command has been
> renamed to "user create". Unfortunately the commit message does not
> provide this information:
> 
> commit b26a4f6232219746fd8ed1b107476f3c23c6908e
> Author: Theresa Halloran <thallora@linux.vnet.ibm.com>
> Date:   Sun Oct 23 15:23:28 2011 -0700
> 
>     s4: samba-tool subcommand rename - change samba-tool user add to
> samba-tool user create
> 
>     Signed-off-by: Theresa Halloran <thallora@linux.vnet.ibm.com>
>     Signed-off-by: Jelmer Vernooij <jelmer@samba.org>
> 
> 
> What do you think about:
> 1.) Just replace the "group add" with "group create" (and keep "dns add"
>     and "spn add"), like in my merge request.
> 2.) Have both, "add" and "create", for all subcommands.
> 3.) Roll-back: Remove the "user add" deprecation warning, add the "add"
>     command to all other categories and deprecate all "create" commands.
> 
> Please let me know :-)

first of all, thanks for taking care! :-)

I would prefer "2" to make sure that the user interface does not change
(existing scripts...).

Cheers,
Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

