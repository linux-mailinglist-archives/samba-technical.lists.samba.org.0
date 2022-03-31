Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7494EDFF3
	for <lists+samba-technical@lfdr.de>; Thu, 31 Mar 2022 19:57:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=zpc+puEcLQhgfVgETmtZsBJZqLV5cqGktObY9MyFkUg=; b=DEk47AnrVk14hpIoeWPzbq/SKD
	6ZNg4yxnG1IhzB1IssbSnv5LHY5QVbYe/MhWfjiJlmXH4FA/3HeL+aDh03cmGoDGQo80szSfHg+BY
	gklhtjmYNaGQnGf+aQWEh0bJjZooKNsA46M5gpmEpM+V3x/+Z5tKb7SLDv5GbrmLbGqZz2GLtxbaO
	0r1lKc19DtKxR2pMBYqwo3X7tQxvx0KWciVHxAKxnWbZ37l8H3CR6IoKB0ia9SpWcuviBlxrToRd9
	kK7BH4xqgUNtLU43p7pR84LLUxL78JWDCQo2s3Ohx4LjPz9Bz9VR2V0xZ7W1/D6yoj5XIgwsXW5Mh
	uLpZmRzg==;
Received: from ip6-localhost ([::1]:48304 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nZz1v-007CtI-Bx; Thu, 31 Mar 2022 17:56:19 +0000
Received: from [104.200.28.160] (port=45078 helo=dup2.asynchrono.us) 
 by hr1.samba.org with esmtp (Exim) id 1nZz1q-007Ct9-9k
 for samba-technical@lists.samba.org; Thu, 31 Mar 2022 17:56:16 +0000
Received: from edfu.localnet (c-73-114-31-46.hsd1.ma.comcast.net
 [73.114.31.46])
 by dup2.asynchrono.us (Postfix) with ESMTPSA id 5D46D2617;
 Thu, 31 Mar 2022 17:56:10 +0000 (UTC)
To: samba-technical@lists.samba.org
Subject: Re: Are there Python3 libraries for the net commands and etc?
Date: Thu, 31 Mar 2022 13:56:09 -0400
Message-ID: <2421934.YKUYFuaPT4@edfu>
In-Reply-To: <926eed4f-2c9b-ac62-a31a-e325d7c09006@samba.org>
References: <CACyXjPw0iqTm=HE9Neb=J99wZ0+=GRdQ0+13+BAuDvvLvQeWaA@mail.gmail.com>
 <CACyXjPwFhse8VtiuitVco-Q9UtpzUSwk3xxUz020rK7M=gtp4w@mail.gmail.com>
 <926eed4f-2c9b-ac62-a31a-e325d7c09006@samba.org>
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
From: John Mulligan via samba-technical <samba-technical@lists.samba.org>
Reply-To: John Mulligan <phlogistonjohn@asynchrono.us>
Cc: David Mulder <dmulder@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, March 29, 2022 3:20:53 PM EDT David Mulder via samba-technical 
wrote:
> On 3/28/22 1:44 PM, Richard Sharpe via samba-technical wrote:
> > smb_mgmt_net_ads_join/smb_mgmt_net_ads_leave
> 
> These already have bindings. See the python module `samba.net_s3`.
> 
> > smb_mgmt_net_ads_status
> 
> This appears to just do an ldap search for the local host, to see info
> about the join?
> You could write something similar using the samba.samdb python module.
> So,
> ```
> from samba.samdb import SamDB
> from samba.auth import system_session
> samdb = SamDB(url='ldap://some-server', session_info=system_session(),
> credentials=creds, lp=lp)
> samdb.search(...)
> ```
> The net ads status command searches for these attributes:
>                  "objectClass",
>                  "SamAccountName",
>                  "userAccountControl",
>                  "DnsHostName",
>                  "ServicePrincipalName",
>                  "userPrincipalName",
>                  "unicodePwd",
>                  "msDS-AdditionalDnsHostName",
>                  "msDS-SupportedEncryptionTypes",
>                  "nTSecurityDescriptor",
>                  "objectSid"
> With the filter: `"(samAccountName=%s$)" % machine_name`
> 
> > smb_mgmt_net_conf_list
> > smb_mgmt_net_conf_setparm
> 
> We don't have bindings for these right now. It probably wouldn't be
> difficult to add them though.

I'm interested in contributing patches for this. I've already looked at the 
code needed to be wrapped (lib/smbconf and source3/lib/smbconf). I've even 
started prototyping.  I've done C/Python APIs before, but it's been a while 
and I'm rusty, so I'll probably start by making a draft merge request for a 
subset of these API to get early feedback.





