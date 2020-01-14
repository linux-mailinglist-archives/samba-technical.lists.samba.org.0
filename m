Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 470FC13A7BD
	for <lists+samba-technical@lfdr.de>; Tue, 14 Jan 2020 11:57:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=KRpN2Yef2SHtQn5bB0C3tPNir88E+Ih8jyAHlWupeIY=; b=oPKWeEpyC4d5YB4JQT/3grg748
	G0lTS8mLS9OYDAKbacwHIxxI7QXqDZUYHdt7BQwERQPZvWMbTOaClnClHenC2zRUUnwid6cIqKPZU
	7KIQQvq+06CdUqu8jmp18r9uSwVvEoGcs4JZL5ca3hAYOdwbpTUbWKIW7Orfm8VUV6O9imFJ8K7jJ
	52qoERzjmrj94xEReWJZtZ74f7ffrx89Jq8c3gkhO0AyRexiRP/FfYeeVX8VCh6fnRxExl7NSj+a0
	3D8QWqsbf7giyEGYrjlQwAzoffyhZEKrmlGZtDTcGCDSA+rc5WrOo7nEJvwMgAF7KjztxB/5p0Lzr
	sbgxps+g==;
Received: from localhost ([::1]:26162 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1irJsB-003LZm-JL; Tue, 14 Jan 2020 10:56:35 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36244) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irJs5-003LZb-Iz; Tue, 14 Jan 2020 10:56:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=KRpN2Yef2SHtQn5bB0C3tPNir88E+Ih8jyAHlWupeIY=; b=HAY2at9vv/bhi0bn387RuHC803
 2GWDEsws0DMiINAScWMPO26Hv6ngRwShb1xkYLJntIUMKE26uWquV2ZGPUVcT7Znebkl23/xHZVMu
 wOkNGp0RjU0mUz4NCfVwXVhBMHivD+W0ccJkelElCXxuLyDcOEtcM35LMHX/QjKz4Exd8nL29h2iP
 uYWN+eoS4eYHnpo5lqRVoXRYRzAx/X3+7xwqFwQlWj/8JJhKL+iWI2Kc0x3jP8n2epUsBSbp0BbHB
 VtH/bYyxWGZx5QZQ6PJycDvaQcKAHpJma3tFemJGifAG5YJP14NM6b33u9GDp4URdffRe7+W/8DHU
 IzpBST3/DorEQRsrT8l95Vqps7PxuO06FGaX97h2P6GCntw3kMUM98xYg94PwP/BN0Fr1S8OAIrDO
 Vhni1oMWr1St/TxIaUMxieUdcpMVTONnIZYSH8bhIKmlHvzjA3XKqpmD+zim8+Y3zSJUsBuoHJnHZ
 /kMFgBb0qvhjU91IZaAenqR7;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1irJs4-0000ED-GQ; Tue, 14 Jan 2020 10:56:29 +0000
Message-ID: <6467e06e362311231f9bf51490f1439c9f0b5ebb.camel@samba.org>
Subject: Samba at linux.conf.au 2020:  Why are we still in the 1980s for
 authentication?
To: samba-technical@lists.samba.org
Date: Tue, 14 Jan 2020 20:56:27 +1000
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: samba@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

My presentation video at linux.conf.au is now available:

https://www.youtube.com/watch?v=D5hl0fqA0Bc

https://sysadmin.miniconf.org/presentations20.html#140

https://sysadmin.miniconf.org/2020/lca2020-andrew_bartlett-samba_2020_why_are_we_still_in_the_1980s_for_auth.pdf

https://twitter.com/NextDayVideo/status/1216938358779203584

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



