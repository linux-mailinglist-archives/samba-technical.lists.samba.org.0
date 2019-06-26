Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BC83D57268
	for <lists+samba-technical@lfdr.de>; Wed, 26 Jun 2019 22:16:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=bSkLywLnmSL/mWIJoSb6KdeBUYyDEYLeuZUPmCd17ek=; b=U7vp/tK3YepV+a+vSmFT9E/RET
	5+/haK5rBUAJQFxy1awl5YJbkgm6eRD1cYhveDuysSWvUh3kPSEpqKvthphlnEZdTfx8/n5ecKVKk
	UX7hYUIghSZkUtJj5SpcxRn/olKnu2+1xPWQ+eyo3/C+opZwpUP3FPJY6/Qd5eSO8I8ZlbP/PvuWE
	sMzMvTLK4Vf7xhQqV1Z93QirHQnX2BRoftf4toPlLIkoN2uJosgkHQdphFdG669wlok9t6xQ16670
	o8UsMyLYGrSHH4cA+uiRJ1s1wL/iTJQHjjMNcQMVYtvV4oPmB0JusJ/CeFzLsUNDvSide3Z1z3TK7
	L9n3cvcQ==;
Received: from localhost ([::1]:25846 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgEKh-002146-Bm; Wed, 26 Jun 2019 20:15:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55442) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgEKd-00213z-PK
 for samba-technical@lists.samba.org; Wed, 26 Jun 2019 20:15:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=bSkLywLnmSL/mWIJoSb6KdeBUYyDEYLeuZUPmCd17ek=; b=jl61hLdGCmhCd7ZRg3eGwJ6rQA
 yZI+0+TvFbbuRFmhi48DbDDxw8pJ+JqVEnc1iAqxoVp5MObJOQxkC5cC2jn+jedOE8MpMwoqApmN9
 oUAYqA/D1W1cLPBhy1oVygyPVEhr+DwLgBacVMCP0DdugQmgmrWlnYXPWPhg1iR74iCU=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgEKc-0004e4-7O; Wed, 26 Jun 2019 20:15:50 +0000
Date: Wed, 26 Jun 2019 13:15:46 -0700
To: Shyam Rathi <shyam.rathi@nutanix.com>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Message-ID: <20190626201546.GA3263@jeremy-ThinkPad-X1>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
 <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
 <20190524024232.GA14980@jeremy-acer>
 <969492C8-F2E7-4814-AC58-9595F66A0330@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <969492C8-F2E7-4814-AC58-9595F66A0330@nutanix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 24, 2019 at 09:04:56PM +0000, Shyam Rathi wrote:
> Hi Jeremy,
> Please find the attached update patch. I’ve addressed both review comments.

Thanks Shyam, that looks good to me. I'll push
it into gitlab-ci and if it passes create a merge
request.

Jeremy.

> Regards,
> -Shyam
> 
> From: Jeremy Allison <jra@samba.org>
> Reply-To: Jeremy Allison <jra@samba.org>
> Date: Thursday, May 23, 2019 at 7:42 PM
> To: Shyam Rathi <shyam.rathi@nutanix.com>
> Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
> Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
> 
> On Fri, May 24, 2019 at 12:18:36AM +0000, Shyam Rathi via samba-technical wrote:
> Thanks for the review Jeremy. Responses inline below.
> +       DEBUG(2,("notifyd: Reloading services after SIGHUP\n"));
> 	^^^^
> 	Please use either the DBG_WARNING or DBG_NOTICE macros
> 	to ensure consistency in new debug info levels.
> 		---- I'll make the change.
> 
> Thanks !
> 
> +       become_root();
> +       reload_services(NULL, NULL, false);
> +       unbecome_root();
> 	^^^^^^^
> Does notifyd need become_root()/unbecome_root()
> pairs ? Isn't it always invoked when smbd is root
> and stays as such ?
> 		---- The sighup handler for parent smbd calls
> 			"change_to_root_user()" before calling
> 			reload_services(). For many other binaries,
> 			either reload_services() or (un)become_root
> 			is called first. I mainly kept the same
> 			behavior. I'm not fully sure about its purpose
> 			at this place.
> 
> None of the notifyd code ever changes credentials,
> so when it runs as root it'll stay that way.
> 
> smbd has to change_to_root_user() inside the signal
> handler as it often changes credentials to the current
> attached user, so might not be currently running as
> root.
> 
> I don't think you have the same problem inside notifyd
> so you can drop the become_root()/unbecome_root() I
> think.
> 
> Test it once you've made the change to make sure :-).
> 
> Jeremy.
> 
> 



