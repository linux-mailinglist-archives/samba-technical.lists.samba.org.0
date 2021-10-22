Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF47437379
	for <lists+samba-technical@lfdr.de>; Fri, 22 Oct 2021 10:08:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=lw8BfoBzZRhmd8G6bMGwL/kz+mIlWlCJDDqLD9mCaWI=; b=rZtzPxvz87oVM7vhKhf3pnFjPe
	aXz/nc5OSEROENwIqBceui0iqrDh6iBTS9wAsG5wXESa688Y+WdMGA54SlhjU011/zfpGtbABXHAC
	ueH2f8JIxt/cdCrZFUmwBx+hJkBEmOf1XVOO3I39mUrc1aGP3nljPoCcs6Cm7aqZYgsnUHr5EEk9Q
	5iMarFdrRYfbqAziWp3eOfymU5p9XP5u0l2R/yMI15tp+WJisi0opSLTQfb1GyBgv+vfVDj4bcSlg
	0nPI35sSTt2jvrEWBxENJxWGfwA7JoNTzlLdS43mpLXYpPFtByhyxyPSlyucqtveCfESNjosckADF
	NsDUnAJQ==;
Received: from ip6-localhost ([::1]:33020 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mdpap-00B8FV-Ga; Fri, 22 Oct 2021 08:07:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:56574) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mdpaj-00B8FM-2P
 for samba-technical@lists.samba.org; Fri, 22 Oct 2021 08:07:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=lw8BfoBzZRhmd8G6bMGwL/kz+mIlWlCJDDqLD9mCaWI=; b=QhxXGSFr7vbZ+X8F4P0l1UL1jG
 9RgnLJvMohcn0apdn3jCSamz1wDE3CAqTZyJ4wjlhn8stBbRLTt06r8n8dp5b4qVSTNTDiAUD0mn8
 jqEDsP45Arcuif/FGrr7xxp5oOVh5pwdnNMF7PZayHVnC1uYZS58weGktY4OaNdDCsaxJFXmSSyhH
 W6gQHv09yoLVpKY7PT2iE3xKEmEd0v5QditK09Z7QOHz22kjm5d2Z/pvM8XEPbrTimFOIgY7t3i+r
 CtIvAk1h9VlgaGzgbwpHlH1KIeDKVPdTFxiwAw5EF0sl1KuiQz5j7aTPYPA1nOTBSjJoDQrKP/uim
 NoHu/8r/eyIZsHB+TuWOewyBMungU+c/6BTWiA0koopCkq35xtC9DqQqkDYzq3x+jwpdnmFml8pYq
 Vfkbvwh1QQ9xpDO0OHPEZAqAO3a9LT1RzAe7kYY05j33+J4vIVtu6IaxPhBLcFPRL9vwsXPleSpSn
 pEst8z3YObn2GJP135/xhr3J;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mdpai-002fzE-6n
 for samba-technical@lists.samba.org; Fri, 22 Oct 2021 08:07:52 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.15] Freezing release branch on Monday
Message-ID: <e7b145da-f61a-c38f-7114-62a3e195f125@samba.org>
Date: Fri, 22 Oct 2021 10:07:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is just a heads-up that the 4.15 branch will be frozen on Monday,
because Samba 4.15.1 will be released on Wednesday, October 27.

Cheers,
Jule

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


