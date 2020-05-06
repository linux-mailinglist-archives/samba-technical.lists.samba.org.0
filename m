Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7432A1C6B44
	for <lists+samba-technical@lfdr.de>; Wed,  6 May 2020 10:18:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=3Kptlqp7HuNmV6nm6qbp19YZvQ41zINIziZbkflYVOs=; b=JDTL7NOuHOl0YqEFZ0EKueP+dM
	GoRCfNrm55QRHWFAm6ia20Qe7QfEXuElhZdBi0S1zqvfp1NSaJt8YiU4skLkteWVgOoeng37KlSTs
	430NPp2WEtCRJiWvnur8AmDkf5bwOHtW+XJc9pVgEzcaTt79z4fFBEiL+dDGHrC0qZtBatELwFDGs
	2rqTuTrMhyd8rDbHY7wmePW7ayOqIByWtXwUbwEntklqrSW0ppzawxLpjFVMrBJdi4VkmnvHL7P0/
	Bf6AB9fs9wuZxLHHypMgiAvtGBSReQrIZCK4SPLehnEt0q7eww56rDAfEqiAzioUm6KGKnbUJhrih
	T1tHwzrg==;
Received: from localhost ([::1]:36008 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jWFFk-002zZy-2c; Wed, 06 May 2020 08:18:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40676) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWFFd-002zZr-5E
 for samba-technical@lists.samba.org; Wed, 06 May 2020 08:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=3Kptlqp7HuNmV6nm6qbp19YZvQ41zINIziZbkflYVOs=; b=Yoo4eeEtNhSh6KYOt78vLPhxNn
 DxAkTN73T3MmA4porSYJfvxSP4CRAmAzT4tvgLzQTM92IAJXyNTV1tcVVqRDCLR/L/4zeUQ1EI6Vj
 Lwg3WbvTe85QB+W5KFusC/sAOZInjHsLld0QTKQfx8O8oYifIkQgZIfIeLa59WQJ1J5gc6GmxueaL
 HFGGH3eYcnrRVZ0uw5Za2eSTgZfUr7g61jksJaX0edUd8EbbFxvBlxb26eHjjfaxz2DiIexs28snt
 H8KpcTJTVSRMQ00hZmOplZfNp4xz2gEsz4BTPnVsxai9BxTFlSUWz4MM8Yk7Fq2XKdFir1Yn4lmK0
 ENX6y9HPwtVMExzjRyxSbibcB19cIgMPmaNQFOrZ/TpAUHstNhMMH39nahUt13EYY0CkwY8yPv8Jp
 NFOdLsDV/n+k8krovOhhXDBi8x55KBHQDpqvZDO4LeOTSb9kYGoGJYUi3AI5bHNlTvD1dGS6r716e
 JuSaz+VhjkuMyhFKSVLH8Xqi;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jWFFb-0003gW-At
 for samba-technical@lists.samba.org; Wed, 06 May 2020 08:17:55 +0000
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.11] Samba 4.11.10
Organization: Samba Team
Message-ID: <419598ad-cc4c-da71-f9d0-95deba1a152d@samba.org>
Date: Wed, 6 May 2020 10:17:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

Samba 4.11.10 is scheduled for Tuesday, June 30 2020.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.11
has been updated accordingly.

Cheers,
Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

