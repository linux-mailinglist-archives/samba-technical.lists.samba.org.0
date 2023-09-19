Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 057577A57FD
	for <lists+samba-technical@lfdr.de>; Tue, 19 Sep 2023 05:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=0fPkpdt2vfiSlmIk0B9b19JAY1c1pSDh3sH0lDS+R3U=; b=LWYS6AR7jr2fXeaqTs7H1Kct0D
	pTMjZAvAHlUe/wGvQmiOdMjtu6MtjsuNRhokhk1JPkf2BMtvn7G1wLiwboApOPl2rVUnPYoNn0CmF
	+waXEH2mhWMKXCQXZEUpXLfJXQwbEw1WYtWxAr/8+EgyUDIFqDJzJ6bfKdaQqqeXTbJtKj5Dk9kxU
	jiWtM8x+6m4x+KYZVQ/T+qCxuLBDYas4RBhi8/rhdCpQbb/tPuMGmJWksdLobhy9Wkgx/5mV5mtn3
	TvJHhckNUslS/pRPqa6sv5322dNRJepPihQqJ7OPog8lnJwguew1Lc1eni9Fmq764OwscKNUXa/ho
	8crn3lkw==;
Received: from ip6-localhost ([::1]:44750 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qiRhC-005EIC-5w; Tue, 19 Sep 2023 03:46:42 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36706) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qiRh5-005EI2-BL
 for samba-technical@lists.samba.org; Tue, 19 Sep 2023 03:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=0fPkpdt2vfiSlmIk0B9b19JAY1c1pSDh3sH0lDS+R3U=; b=gmniDYBMGIacDdE1Lg31aRcQ3s
 1fIbNerltGpnfz0XDkt0Agw5LCsQIiKkwL2UcnqZYswVsKss0SRX2cKgi70NbJDgVDg79Q56kAOTa
 vbRFLqCkHj+dtk2jtDzL/VOyy5ERCvwzNMJPyoU3JP4laVNav5vAy/WAPYWNL+B8Q20VBDk+sNSQI
 4D8PF84r8232v4PoKgjtpVNPdQLP/aOnPSBlbH5geBNZitZ92uYtBmoph+M+l9qDm05JdFZG6FeHc
 g+ZdMBaxAurUc/ltnWgd18hASoiKRC8OtMA89HYntH5rAXxH6jjSQ20CzAc5A5lSXGXaqB/9kZX63
 +Blzz9lHVDYZ79zGrpvQi/CuSjpub/d1PM7Oy4vzdQEuRlJHcaB67pHykhdXEyh6IJzTI3cZ5GY01
 VvsRxjOhY8iQoRhPYv0fdyzhgkHAqpZEnTIjn1GfapQOKZ4nNr+yti054tdNLLltVCyaaCYWYRsbl
 3bAve0OhwGf/Cn4vajBJOSrC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qiRh3-00ECQw-18; Tue, 19 Sep 2023 03:46:33 +0000
Message-ID: <16545b96-a0ff-a83c-6297-d361fbf5e440@samba.org>
Date: Mon, 18 Sep 2023 22:46:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: The current progress of transparent failover features
To: samba-technical@lists.samba.org, Steve French <smfrench@gmail.com>,
 sharingfun520@outlook.com
References: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Content-Language: en-US
In-Reply-To: <DB9P192MB1684885556BC1D4D7C063923FEEEA@DB9P192MB1684.EURP192.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Steven French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steven French <sfrench@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Are you interested in this from the Linux client or Linux server 
perspective?


The SMB3.1.1 protocol has many features relating to transparent failover 
and reconnect.   The Linux kernel client implements many of them (there 
are a few features, like Lock Sequence numbers on reconnect that are not 
implemented yet, but most failover features are)

On 9/7/23 05:06, 陈 方进 via samba-technical wrote:
> I want to know the current development progress of transparent failover features. Where can I get related resources?
> Who is developing it? Or has development stopped?Ralph Boehme slow@samba.org<mailto:slow@samba.org> 's git record of transparent failover features only goes back to 2019.
> I want to studying the transparent failover feature, which achieved in the Windows, but not on Linux.
>
> 从 Windows 版邮件<https://go.microsoft.com/fwlink/?LinkId=550986>发送
>

