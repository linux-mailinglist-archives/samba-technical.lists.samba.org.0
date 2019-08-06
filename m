Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8C82EEE
	for <lists+samba-technical@lfdr.de>; Tue,  6 Aug 2019 11:43:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3DlmiOknks7sMwpMTV6GjNV/tMcVugY8l2pr5Cf+XR4=; b=Ar3fF9uBNVCcxhd547K0bvE+On
	aiXTSWnMPK4V+zmdrrcrSEJbSreCs2klallHH+6Gi1Q+K++FB1/3/gfSLfdmLDuGeswqBEf6JRc8t
	ZHvzgm9QF1JQs+DUZuprsH50GY9KjDB6m0FXub4yqyNRoHAVsYDPGFAKaTJTE9/kjFdIeYSS3UshV
	JjAeiL0vmuIImfTRLYEC1XVyX4aKqFwVr/e1Ot9Sl22APzzlHnS1AIh2XtUr+5tpshlI+p8BkIHHo
	w1+WKZE2beonEms2jCQZuN5OItsoc0rU3l1Vd1Pd1fC/T0qZU0Qm3Rv0s5eFFk6zow7XzZJz266is
	zaA3VH1g==;
Received: from localhost ([::1]:57822 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1huvzj-004XQH-Um; Tue, 06 Aug 2019 09:43:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1huvzf-004XQA-Uh
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 09:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=3DlmiOknks7sMwpMTV6GjNV/tMcVugY8l2pr5Cf+XR4=; b=O/DJgjNMyABtrFT7qy6N+Y2CVU
 xH7QpEckVhdCCbMQXfK+jdaesvKAZWnUZ37NPYHQuVnG/RS49RzY4X/5vvP/Jyt4iTVyOA9FwxGIH
 grOI5CcqVqLiRxFZhMle8lL8eHEYlRk2Kkpm4S/kblh9qyqcKO7tgSuNiZtFzdVRIpyw=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1huvzf-0004BY-Ip
 for samba-technical@lists.samba.org; Tue, 06 Aug 2019 09:42:59 +0000
Subject: Re: [PATCH] doc: improve vfs objects parameter description
To: samba-technical@lists.samba.org
References: <20190805152257.GA27074@sernet.de>
Openpgp: preference=signencrypt
Organization: Samba Team
Message-ID: <b4e0e982-b902-8e49-c1e8-31b66f520188@samba.org>
Date: Tue, 6 Aug 2019 11:42:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190805152257.GA27074@sernet.de>
Content-Type: text/plain; charset=windows-1252
Content-Language: de-DE
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
From: Karolin Seeger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Karolin Seeger <kseeger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Björn,

Am 05.08.19 um 17:22 schrieb Björn JACKE via samba-technical:
> Hi,
> 
> review and push appreciated for this ...

pushed to autobuild-master.

Thanks!

Cheers,
Karo

-- 
Karolin Seeger			https://samba.org/~kseeger/
Release Manager Samba Team	https://samba.org
Team Lead Samba SerNet		https://sernet.de

