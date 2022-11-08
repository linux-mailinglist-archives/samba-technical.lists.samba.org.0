Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D074A620B46
	for <lists+samba-technical@lfdr.de>; Tue,  8 Nov 2022 09:34:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=HMvbfCFUjTx0ioEcsF40SkcdsXHBJR5eCZikTotmfxE=; b=OTofOLlQPSpmDF+RD2T9WkkbuY
	6mSVevLYdezuEl2M2IL1aweaNdmR14Qf5lE+0RKLaCR/c2ku9FIh64oT37otG6qkO1Ho8ZEfrPL54
	URpkY+ebAdOMKuwoqcmLFusiZhKNpwF2GbDlRxP3Cxjw8f1qGRolVQvJjpo/Qxk+jjmbzuHLA6Xzt
	YMgeT19tDcMsRq26d+LeIx2MoO6pH6mY+wn8/X9rsAEO4igvzSX1jmAmURm5s0lc05uPdmVMHPzyU
	DIhKOEnSwz0p/KtnQ7DbbwTA1uS1q/gSGek6udZOwK2f5RNVX8KjLAKur0ctikbSbGwtIyXiERyE4
	71R8/1HA==;
Received: from ip6-localhost ([::1]:26336 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1osK3p-00BSbL-1T; Tue, 08 Nov 2022 08:34:21 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62306) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1osK3g-00BSal-7J; Tue, 08 Nov 2022 08:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=HMvbfCFUjTx0ioEcsF40SkcdsXHBJR5eCZikTotmfxE=; b=Gq1iWtC1saBMmy9hrh6qqLBPXO
 xHGMO28b4sX9BBpLPjv/se/ZpsCV079yvkDnttDf6V8TeJsio9DWHOwH+OfpfQU8/Eqv9id0yrotE
 pR3ihKNHG6WJ7GxVEVWgaCEPvoNb4T9omCk6ymcQ8+mkpDnuqCYY38BaUs9LnOdtufwLFvvry2TD3
 ZtOPAVFyD/G405PtFd1YndeW6FMTj20bDFnlKxfW7g3gLf5OE81Q+xJKqEgxeWuUf9IVS/LmqeSSr
 LHHHjpyPXy4J8s9R61DJr5zFwkwpMMw2zvlYwUGnAapw9j5aPIXgm07J5wg0yXd6IE2aY6ifoNXMk
 N55Jlt2uv1nK5kwPu/HJ6dCmdPWVt50HlV1pDsrUutlAY0wLWXmLkNBsA9KnDHzisWlUtolelDHE2
 cN6sRNYJaymE+BY4+AJ51FPKpiWrbGs2rYvLZendNJ6zpVhZdt0Od20YUIs3ITSSrZNJgcyEnT4w5
 rWEbbw1KRWn/Tuiah4ZsoLaC;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1osK3f-007fy3-A9; Tue, 08 Nov 2022 08:34:11 +0000
Message-ID: <dbbab218-aa21-6e63-7e71-15ed89324f6a@samba.org>
Date: Tue, 8 Nov 2022 09:34:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: de-DE
To: samba-announce@lists.samba.org
Subject: Heads-up: Upcoming Samba security releases
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

this is a heads-up that there will be Samba security updates for 4.15, 
4.16 and 4.17 on Tuesday, November 15 2022. Please make sure that your 
Samba servers will be updated soon after the release!

Impacted components:
  - AD DC (CVSS 6.4, Medium)


Cheers,
Jule Anger

-- 
Jule Anger
Release Manager Samba Team      https://samba.org
SerNet Samba Team               https://sernet.de


