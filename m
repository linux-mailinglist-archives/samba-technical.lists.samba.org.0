Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC89B1DADC
	for <lists+samba-technical@lfdr.de>; Thu,  7 Aug 2025 17:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=K4GAzzhGAOHyx9Cg4muadiyRecm/atXJL/PNE4TsmSY=; b=xu8QqdRqchoP/fXVGbsW9rn18K
	h+RAboZQ5izlTZQDNM2MKlyDch4wEWrvQ+fwyDGzvpA89tVTOpWAwRlpsBWTpPVkmTUI9vbxXS/B4
	Krpv+U94JzV1JEtZHqMg+qeB9GwsQjMa51GCXIbka2LFEaZDbLvm/y67oh96daxQ+UnffpzjlUEjZ
	KJmiIuUwmC/hBFkg5k1/4/RuP10au/beMaQsGonq37fW4jCY/H9TjgNF6xOUrQH7E1dQii7GiViEP
	FQ227oINVQOmTWE+2qA4bK2WK3Vq1eeH4Z5OuxadHxYPyg74Wa77BZP3sy0gbu7Q0ujzpFOhQkF4b
	PP/jJeAw==;
Received: from ip6-localhost ([::1]:32022 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uk2dJ-00EYWH-2r; Thu, 07 Aug 2025 15:34:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42494) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2d1-00EYVF-Sn
 for samba-technical@lists.samba.org; Thu, 07 Aug 2025 15:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=To:From:Date:Message-ID:CC;
 bh=K4GAzzhGAOHyx9Cg4muadiyRecm/atXJL/PNE4TsmSY=; b=LIFvcDyaI2pjXwDdmjrg2ixaK3
 nnFgHNBus8+tztxuuIZFdlh0sWnHvzOrCZ4Fsp1ia9jF/EldZLB/E4/m4+1nWd6bnNBXNcY893Jaa
 dNeMxmI2STCNEYttSL7azdI5Aij1hPX+hvvewX6U2xPQ6IhuJ6fmvbHRAceMFiMWtqEAUafYQlLJe
 CR+LdC2HLdAzelQ06suWXhFwXXuat3uf+y+E67ay6azrhErzrYaXP9BrfbBtyhg9UkQzh99clcPZX
 Hv0qunwFSqSMq+0nN572uq3nvqOvIfYuEa8eLxriy88rSiWfHI4G6xnVPxhxMSTjYj5tfrgCN74MR
 gbBBhRn6MFx6l2t4xcyNfYycEoNFeE1Zqb8RQSItcj/56qPcBM261V672dL5ayDJ+Kh/afjDMmvnY
 x6iM+emU3FYnc4+ADgz6Rl+V2dVY9Hap6sU6MEGobJPNZCet8YmKZA6QM1UCK3E3QBTp4V/64VGRc
 Z1vRSOsAYj1luMUO6CVJ7wg1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uk2d1-001c61-0M for samba-technical@lists.samba.org;
 Thu, 07 Aug 2025 15:34:03 +0000
Message-ID: <60902b9c-3b00-4f23-a590-68651036243c@samba.org>
Date: Thu, 7 Aug 2025 17:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE, en-US
Subject: 4.23.0 WHATSNEW entries missing
To: samba-technical@lists.samba.org
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

the WHATSNEW for 4.23 looks pretty empty so far.
If you have added or deleted a feature in the last six months, please 
send me a description to be added to WHATSNEW.

Thanks!

Jule

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de


