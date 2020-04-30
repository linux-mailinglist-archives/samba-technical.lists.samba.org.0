Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7B11BF4F2
	for <lists+samba-technical@lfdr.de>; Thu, 30 Apr 2020 12:09:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=AbWnnmorp7hnW6h5Gt9rm/8/qgAlPSaYSbk7NhsdQOE=; b=zTktvMNsRIGtQWuFO3coD2LW9r
	GzsKFfKz1Qf+BNekOpVdKhV2H9iMMXXtmnq18OYI4X/2nmtO3xjDim+cO2OE1Usmg1U1nP/MLXjKN
	y8ZyD5qg/9FLqhWy/zOHNYk1APHE5jTflY/G4E41vBDS+AU16L+wgMtMf5MoJBwEawiZpSK4R2rOd
	krCQoZ0cYVWVrl7M+H3WbkVNyIsd7hwU31evTv0HQKHdFoMfLoWOtpUKvel+M9oz0vnWn1UXiIoMk
	hkK7kKF8HRQu7sE5c3ENczK07OQUOrIo/GJ7cR39pSItPOj9umVvlFmIOYQQf0m4WUukcq2HfqzSq
	4OR9C80Q==;
Received: from localhost ([::1]:29310 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jU67C-000AB2-Az; Thu, 30 Apr 2020 10:08:22 +0000
Received: from mail.sernet.de ([2a0a:a3c0:0:25::217:2]:51373) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jU675-000AAv-35
 for samba-technical@lists.samba.org; Thu, 30 Apr 2020 10:08:17 +0000
Received: from intern.sernet.de by mail.sernet.de with esmtps (Exim 4.92 #3)
 id 1jU674-0003uR-MG; Thu, 30 Apr 2020 12:08:14 +0200
Received: by intern.sernet.de
 id 1jU674-0004Nv-GW; Thu, 30 Apr 2020 12:08:14 +0200
To: samba-technical@lists.samba.org
References: <20170324092636.316bd8fd@devstation.samdom.example.com>
 <1490566775.13579.257.camel@samba.org>
 <20170327082840.6a00bc45@devstation.samdom.example.com>
 <20170329130458.GB7532@sernet.de>
Organization: SerNet GmbH
Subject: Re: [PATCH] Remove 'samba-tool user add'
Message-ID: <c542e524-c576-5af4-5315-fa8e253a9180@sernet.de>
Date: Thu, 30 Apr 2020 12:07:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20170329130458.GB7532@sernet.de>
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
From: =?utf-8?q?Bj=C3=B6rn_Baumbach_via_samba-technical?=
 <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Bj=c3=b6rn_Baumbach?= <bb@sernet.de>
Cc: "Stefan \(metze\) Metzmacher" <metze@samba.org>, jelmer@samba.org,
 Volker.Lendecke@SerNet.DE, Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

>> Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
>> wrote:
>>> Can someone remind me why it was deprecated?

On 3/29/17 3:04 PM, Volker Lendecke via samba-technical wrote:
> Also, shouldn't we align this with the group commands? There we have a
> "samba-tool group add", but no "samba-tool group create".

Hi!

I would like to continue this proposal and like to read your ideas to
resolve this.

I've recently opened a merge request with a set of patches which rename
the "samba-tool group add" command to "samba-tool group create" and
deprecated the add:
https://gitlab.com/samba-team/samba/-/merge_requests/1304

I planned to fix all other "add" subcommands, but I've noticed that most
of the subcommands like computer, contact, ou, ... use "create" already.

In addition to the "group add" command there are two further "add"s
left, but they make really sense, in my opinion. It's "spn add" to add a
SPN to an account (while the command description says "add - *Create* a
new spn") and "dns add" to add a DNS record.

I think the "add" command is generally more comfortable and seems to be
more natural, even for adding new users or groups to the AD.

It seems that several people wonder why the "user add" command has been
renamed to "user create". Unfortunately the commit message does not
provide this information:

commit b26a4f6232219746fd8ed1b107476f3c23c6908e
Author: Theresa Halloran <thallora@linux.vnet.ibm.com>
Date:   Sun Oct 23 15:23:28 2011 -0700

    s4: samba-tool subcommand rename - change samba-tool user add to
samba-tool user create

    Signed-off-by: Theresa Halloran <thallora@linux.vnet.ibm.com>
    Signed-off-by: Jelmer Vernooij <jelmer@samba.org>


What do you think about:
1.) Just replace the "group add" with "group create" (and keep "dns add"
    and "spn add"), like in my merge request.
2.) Have both, "add" and "create", for all subcommands.
3.) Roll-back: Remove the "user add" deprecation warning, add the "add"
    command to all other categories and deprecate all "create" commands.

Please let me know :-)

Best regards,
Björn

-- 
SerNet GmbH, Bahnhofsallee 1b, 37081 Göttingen
phone: 0551-370000-0, mailto:kontakt@sernet.de
Gesch.F.: Dr. Johannes Loxen und Reinhild Jung
AG Göttingen: HR-B 2816 - http://www.sernet.de

Samba eXPerience 2020 - online edition!
sponsored by Google, Microsoft & SerNet
May 26th-28th 2020, https://sambaXP.org

