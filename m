Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3B83198E6
	for <lists+samba-technical@lfdr.de>; Fri, 12 Feb 2021 04:43:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=CQ/p38Flx1Pbri5Y1JGHNxY71sEhRLiZXMghQu6PiME=; b=Zk8F+AOnJ4FhDb0B1LRAYkgG3b
	awmC+4bPALV/4Vpp2c3noobrPUBFexhvXQq+or4FvKQmsmBQjaVGsW7DpXqXfLggCRl9Xe2zHzUv3
	8rWDnYHnRRSm5npa1KGEd4W/mS3+ze2ezL6oV3PHGzXtCEIV+mShZhAIrTcyeg2rcNhijLOuvGNpu
	EPJllqUW4zlLsSGeq16wY0d6DkWF0DKCEaKOlMUNn3t/Wm2w4U25hE2eWr2PHxzuGF+Ja4bG36TOx
	TNWxBEOZIw9aX966gt06TvKUbtbdfHcNjgPBoOC27Bets23Aj0cLZi5b900c4NewL0MpppgSFohcX
	qqeduNNw==;
Received: from ip6-localhost ([::1]:19098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lAPLz-00CLRD-SI; Fri, 12 Feb 2021 03:42:47 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz
 ([2404:130:4080::4]:56392) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lAPLs-00CLR6-WD
 for samba-technical@lists.samba.org; Fri, 12 Feb 2021 03:42:45 +0000
Received: from [IPv6:2404:130:0:1000:55ef:8b04:869a:4233] (unknown
 [IPv6:2404:130:0:1000:55ef:8b04:869a:4233])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id BDC9181DC2
 for <samba-technical@lists.samba.org>; Fri, 12 Feb 2021 16:42:05 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1613101325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:autocrypt:autocrypt;
 bh=CQ/p38Flx1Pbri5Y1JGHNxY71sEhRLiZXMghQu6PiME=;
 b=q/P4hERLzH4iM7JI7tTEDFTlana+CaAaGUAK4VVgjNw+PfA6WaLU8XUxHVWcXCczEGJsRj
 wY1/ZQgl2NQ8xGdpN04mHEidC1aowtas+lQG9Yv7m7Zx3VjfyHyTM30CUkqwpgkJ2pQBM7
 YZFKVELuVYZpBP0TiUaDKGtedM6pqosEyRsn260t/h7sK2R+RBt+odhGyzTrlHMcbRyewl
 EwOX0BldfixYAq9S97FyG3SQnxVwIbKf4Zs/OgibO+zJcWRU4TkTFSiJ7EFiDGp3cvPrHG
 m9ilDu0Omuka4A635jw85Ow901KeYgXUvcOXLiKlH9R7ogNzgaDwasUIsj5ISg==
To: samba-technical <samba-technical@lists.samba.org>
Subject: truncated gitlab samba-ad-dc-5 pipeline logs
Message-ID: <c208bc6e-d57f-6ca1-315f-662e7a68f580@catalyst.net.nz>
Date: Fri, 12 Feb 2021 16:42:05 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-NZ
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.10 / 15.00]; ARC_NA(0.00)[];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 MIME_GOOD(-0.10)[text/plain];
 DCC_FAIL(0.00)[failed to scan and retransmits exceed];
 MIME_TRACE(0.00)[0:+]; MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Since around 18 September last year, the log for a successful
samba-ad-dc-5 job has ended like this:

  Job's log exceeded limit of 4194304 bytes.

e.g. https://gitlab.com/samba-team/devel/samba/-/jobs/744619956

Nobody cares about that, but now I have an *unsuccessful* samba-ad-dc-5
job that ends the same way, which is to say it fails too late to leave
any trace. Of course there couldn't possibly be a problem with my code;
I just want to know the logs agree.

Things I have noticed:

1. Some older samba-ad-dc-5 logs were bigger, and Gitlab allowed that.
They seem to have shrunken the limit.

2. this happened around the time of ZeroLogon, which increased the
verbosity with ~1M of this kind of thing:

client_account[schannel1$] client_computer_name[schannel1]
dcesrv_netr_creds_server_step_check: CVE-2020-1472(ZeroLogon): Check if
option 'server require schannel:schannel1$ = no' might be needed!
dcesrv_netr_creds_server_step_check: CVE-2020-1472(ZeroLogon):
netr_LogonSamLogon request (opnum[2]) without schannel from

which maybe pushed it over the edge.

3. The bulk of the log follows this pattern:

Failed to connect host 10.53.57.14 on port 135 -
NT_STATUS_OBJECT_NAME_NOT_FOUND
Failed to connect host 10.53.57.14
(1cae2ae0-54bf-4728-bf9d-7cc40958d0c6._msdcs.addom.samba.example.com) on
port 135 - NT_STATUS_OBJECT_NAME_NOT_FOUND.

The internet says we can't configure this limit (I checked the admin
screen anyway).

For now I have added a patch to shut up the NOT_FOUNDs; once my original
patches are vindicated, I will look into a proper solution. Does anyone
have any ideas? Do both those connection failure messages need to be
DEBUG(0,())?

Douglas

