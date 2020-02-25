Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DA016EF84
	for <lists+samba-technical@lfdr.de>; Tue, 25 Feb 2020 21:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+A2BiEqdZl0HYACbeyq92PSgT1rWdqBQY6Sq5LFytiI=; b=d+PQ5oMTZAfHE165YxB6+qBwIM
	A+4qEz+TpZI6vL/arD2MZsH9HpCGgjVra2Vn6wIJ09k5civ9W0BIFmM1d95AhF3e0aE2W/UMMEj7D
	5ZPFjFm8iHL5kl+bCzP9BWUKLk3Im2ZECfMKnrE2gSG0k+clZbFS1XSoYfPaGLABZkSKhggoeVaNd
	HEnANfvmOs7TSSYiDMRPqli2ymsUh/wesQvxGXxSDCRpBTZ57Z/0cRvtnjXz7GFyx7rimCQp0U8xl
	6LQAMINMDl1QmBDNGjpAHdLANiXeo6TFausrPFalvXexsxSxbRzuGmb8Bpkgib8mj6DjkvGFsb1Ct
	bzZm5THw==;
Received: from localhost ([::1]:47494 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j6gNW-00BewT-0j; Tue, 25 Feb 2020 20:00:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:35264) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6gNK-00BewM-Vf
 for samba-technical@lists.samba.org; Tue, 25 Feb 2020 20:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+A2BiEqdZl0HYACbeyq92PSgT1rWdqBQY6Sq5LFytiI=; b=zyl3UiWKosE82OKTsyb36FXjlQ
 Wupdgb3K2srtZMVKakxwiHVl6p8jfnt4o6+evyGKV0GTPuljcYbUfZzNn8N/bdU5qhVt7nXubSC72
 0oqZXyK42DRJZ2weviLUzcG+pXarkQg3PvcJQBhJg1ivxVWCraqKD7KMdQFBTH+8a9qGohZczLxit
 NS194j95VJxptjT/+X8bnK+o5yaKElu0pGj8bsN8Kb7L33eQCK19IiGJauDvXL0H/cZkrz1PV3QM+
 9rNd0SDqL28grA1rFakzda8CjH9pF0p9VDBEd5F1BteTvVaRn6hVGq3N09MutOppKj4TiMoqCGlAY
 +MsGV1h1Gi3QdLzTz9fFjHmm/x1M8AVLoV0319oKhPK0GQatd5j9oU/2iswEDqjpOY4Ifx4mLR5n1
 Tj7SNzBa85InrB5RHV0XIdj/o0sJqkmaHCEKwg51iDvAej/PONUu5itusBjSgzxiZmtUj/AY3Hjag
 zv9CTgVoEJnulTnLNg2y0IOa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1j6gNJ-0007J1-SL; Tue, 25 Feb 2020 20:00:14 +0000
Date: Tue, 25 Feb 2020 12:00:10 -0800
To: David Mulder <dmulder@suse.com>
Subject: Re: rpc.spoolss and rpc.wkssvc use RAP
Message-ID: <20200225195856.GA2116@jeremy-ThinkPad-X1>
References: <7b5a4761-1490-7aac-5ee5-1271eae751d2@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b5a4761-1490-7aac-5ee5-1271eae751d2@suse.com>
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
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Feb 21, 2020 at 08:42:48AM -0700, David Mulder via samba-technical wrote:
> When looking to create SMB2 tests for spoolss and wkssvc, I was blocked
> because they make calls to RAP, which is deprecated with SMB2 (according
> to
> https://docs.microsoft.com/en-us/openspecs/windows_protocols/ms-rap/6676494b-2a48-41dc-8289-009895f22ab9).
> Specifically these tests use smbcli_rap_netservergetinfo(). I couldn't
> think of the best alternative here. Anybody have any thoughts how to
> work around this?

 think all they're using this for is:

rap_get_servername()

to get the target server NetBIOS name.

I think there are other DCE calls to
get this name (can't remember offhand
which ones but I know they're there :-)
or just pass in the server name as a
test parameter.

Shouldn't be a blocker long term I think.

Jeremy.

