Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1C61E10D8
	for <lists+samba-technical@lfdr.de>; Mon, 25 May 2020 16:44:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=5u+ygGwV1m4UNbg4+eUgsie5KOJKzdQAVvMwGtAFS4s=; b=QFjS5MtvIh25gB/WliN2vIq9JS
	TsN1+b7cYNoQczE0SdcaX+Hx0K3KB28oAxif4kP6hAkHCQd0SdW3iygNZ61MYkIbPHAJdXzrOXB10
	J2r2GdqCUfrqh4dGng1J1gN7G3UAjKs6vJw4T6uO9M1mvrxSXE+Z//eeKX6yi7C8CnqSBaaidtDw9
	WniD6KzkAFt/dtPJUCkyFknL7YGX7N4nacy6aSTbgAmeXw8d1C9NjH6iq7IfK34d4PRi3wMRBnria
	ev1B4k6IpSDsLjE+x9l3ZGf6bZq8sMaf2HA5B03zLv31NuFPelJhXnJ8w23dOabAPW164kpGQQRrl
	t53R5k4Q==;
Received: from localhost ([::1]:38624 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jdEKi-005m65-9o; Mon, 25 May 2020 14:44:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:59560) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdEKd-005m5y-Nq
 for samba-technical@lists.samba.org; Mon, 25 May 2020 14:44:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=5u+ygGwV1m4UNbg4+eUgsie5KOJKzdQAVvMwGtAFS4s=; b=XIL3CjVRmCbCYzQvr3qvAmI/kf
 LzStEnsVdxsRQsyV8rnf1k7fy3leONre8Z2/fRJ2q44XGRNKiV0FUVtkaCTSyKcJkz1QZunsE77yR
 qAkiiqrPMc2F1l9LrdxwBv8hjHoDSDjsTNqsRfJdxdWmxywti/AT85JUbzVJWoAjHrz6vj7i5aX6S
 nfGBGKZtoHY7k40acsFOWlGwgOeZi/egARP2EmhULGpGOfsR8NetSzkZoSrdMXBWrEC2sZLdol2Z9
 WUIsRR/kQGCGnpaAXu3in408pm+S5VtzEJkXf2AtPcz1uW9oBNAINXRN82gwsIYyWWhas+Snc0JMn
 SXYzi67yNN0cNg6bMEtj06SXfpqDct7ejndghpCSAeumSRsUTZioXjeAdGj1yZbIfyjk5DBMKhdGn
 SRSi6lu/2uj7XncqVsDXRaZX7kC5EhMByDtmo3vZNn2JQbHKq6ktzmOFj2Qz1G6R40LMaGMilpIPH
 PetILAiTtMcg+QHJAOGnVCr3;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jdEKd-0001mn-44; Mon, 25 May 2020 14:43:59 +0000
To: samba-technical@lists.samba.org
Subject: Re: [Announce] Samba 4.10.16 Available for Download
Date: Mon, 25 May 2020 16:43:56 +0200
Message-ID: <15299219.PEbobQMlR1@magrathea>
In-Reply-To: <20200525091428.GA11978@carrie2>
References: <20200525091428.GA11978@carrie2>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Monday, 25 May 2020 11:14:29 CEST Karolin Seeger via samba-technical wrote:
> Release Announcements
> ---------------------
> 
> This is an additional bugfix release of the Samba 4.10 release series to
> address the following issues:

Thank you very much for your work Karolin!

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



