Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E929F8F
	for <lists+samba-technical@lfdr.de>; Fri, 24 May 2019 22:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=RBZIP9F/LzgpiyUpKp3FOGbFrjINLV8rBGbE+PWqHDo=; b=YVmxK/J/azU118uxiyfEQhQp1H
	VnFfsyclHZ/fmJno/j788zGP6/fRpnFFiXjThiETLIRUfGKOH2x+4CYyKeCXd3gU6CzQFeKTnPxRf
	LpGUHLeIqud2Sg0OLaQ7kZifqC+XUsj96HUe/xJowukB1TbC2Fkvw2AwZ7QmBAXBVMJ05JvpP3H/L
	fN1IfV4ePhAixiJ8JdSTfQM0xlxQhWFXt7ovhO8PWNowPQYSxnXMmfDtyoKtdiamuGSWvb4h+uwkR
	vMeaTX7NiZNJnYime5J/hkPPxGreBTkxHRlC03bO1tz/BLZFKi3UN08aB18ZchroY3u6OtZXHB5tp
	EapPHW+g==;
Received: from localhost ([::1]:33826 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hUGR9-001eOn-M6; Fri, 24 May 2019 20:05:07 +0000
Received: from [2a01:4f8:192:486::147:1] (port=34780 helo=hr2.samba.org) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hUGR3-001eOS-QH
 for samba-technical@lists.samba.org; Fri, 24 May 2019 20:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=RBZIP9F/LzgpiyUpKp3FOGbFrjINLV8rBGbE+PWqHDo=; b=YFYIn7Yau1xaggxAfjlIyGtzJV
 ktcsOeVgs00p/qPYHOG18ENaW1a69Ro+nNPYfoyK+nJugWS0tgLQZvrTjbCyJG1FhbrJfXMLwzoNS
 nSQ2JojMTOau9MJyNuIDsi0DRIcHs17S281JH6hiRB6qmM8doRXdY3iCBKuQWWrEz/i8=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hUGQx-0004Ll-AZ; Fri, 24 May 2019 20:04:55 +0000
Date: Fri, 24 May 2019 22:04:53 +0200
To: Jeremy Allison <jra@samba.org>
Subject: Re: gitlab question.
Message-ID: <20190524200453.an67hsjv3uwy3egn@inti>
References: <20190524174326.GB136126@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20190524174326.GB136126@jra4>
User-Agent: NeoMutt/20180716
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, May 24, 2019 at 10:43:26AM -0700, Jeremy Allison via samba-technical wrote:
>Asking to improve my gitlab-fu :-).
>
>Ralph has a branch containing modifications
>to a patchset I posted here:
>
>https://gitlab.com/samba-team/devel/samba/tree/slow-bug13964
>
>I want to check out that branch so I can
>see his changes as a list of git refs
>(i.e. I want to checkout a copy of the
>repo it created for him).
>
>How do I do that ?

add this to your .gitconfig:

https://paste.fedoraproject.org/paste/lSDOgcCzTXpYK9ggkIBXIw

Then run:

$ git fetch gitlab
...
$ git load gitlab/slow-bug13964

To view the patches of a merge request:

$ git mrl $MERGE_REQUEST_NUMBER

eg 

$ git mrl 490

to view your own recent merge request.

Hope that helps.
-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

