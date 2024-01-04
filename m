Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06BE6824516
	for <lists+samba-technical@lfdr.de>; Thu,  4 Jan 2024 16:37:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=Y47PAAENZavm9udizBbPVC1/vnxc7Aif8kFozYgWI4A=; b=0FolcYzbPsi/Wm/3d4Eio+LRMM
	J21wIL5zcZ/x8mGwoo0w2x0LVi9DdP/xZ8snyEGTHmEqhKSKkg7KZbBz6UhquLc71NC+hTmrVBdkT
	voR87imn1FsrtrcVTRFSheHIWNIx6jwBkLttuCpEmuBAW70F/bD/3A6loDgeYHW1qhtwjA4knU6LA
	IlISZ5yeDutVeKbJYcVSH9FGhVvlng55dT2FaEAOPAhWwjPLhVzxwMfDRjLdxHKRItLT97GYtiFAH
	8qfencJ6xwDWF7aF96OS6Plj1SUMcWb+odVHM80yAInlKEWE0luLSdCS0iqcwH05kqj+WqDNM8AQ1
	RJ+awjmA==;
Received: from ip6-localhost ([::1]:54356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rLPmB-002OA5-8c; Thu, 04 Jan 2024 15:36:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:50234) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLPm6-002O9v-A0; Thu, 04 Jan 2024 15:36:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=Y47PAAENZavm9udizBbPVC1/vnxc7Aif8kFozYgWI4A=; b=LtNIcgS/lvtHmAk6yx7ir2ovdf
 ijkb86o/9bKXV0Nw3rlqoL1n/p+LnjUC4hlm9Fd/H1GZfwQUYhuuzdByXF9uv/Sj8j3QHIpsLnhNg
 0uttQTn7kA7hXLdqN5u/F9pa0rXwPgNUBZD1sqhx9DdfFhQUDyBl+SyxqWZA/hjvGll2jTue2Un0F
 MjxWtupVJgdfd2ejKXzbx72Ovwq1gDeSop8KicT0AJ/RMlkPOCTUe/yvECJq3XLYygOck/xLmVcGp
 8elR2fvWjuvPs+vpRyD5+w9ZVYo7lF5GO1tyxFqPp2bTu/ReYoRuMnWzyZshVY6zze/eb9msgfa4y
 6Cd9C/sFoYsIVxyD+LzQT/bX4Q2M0cPyeBCYwQibbjJ7aL7uw52Vr1ubi3c/jGzM3xxifd29XGWK6
 xVZSe6o0S5sptndzpp3E5bb5TCHGkRH1ZRM0Rj8xMnj/Z9G60T8pr22n8XNCxPw2UJdrs4DtF0V18
 oBn/p4rHATruv3Ty29ST6rqK;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1rLPm3-006SCn-2O; Thu, 04 Jan 2024 15:36:47 +0000
Message-ID: <1035138d-6d68-4d7c-a72e-9b442605c776@samba.org>
Date: Thu, 4 Jan 2024 16:36:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SCM] Samba Shared Repository - branch master updated
Content-Language: en-US
To: samba-technical@lists.samba.org,
 "samba-cvs@lists.samba.org" <samba-cvs@lists.samba.org>
References: <E1rLN6n-001rox-TX@hrx0.samba.org>
 <0fa277d9-f283-4208-91f8-48ef4b985c3c@miami.edu>
In-Reply-To: <0fa277d9-f283-4208-91f8-48ef4b985c3c@miami.edu>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 04.01.24 um 15:36 schrieb Brown, James William:
> On 1/4/2024 7:46 AM, Stefan Metzmacher wrote:
> 
> @@ -3905,7 +3937,24 @@ static int moveip(TALLOC_CTX *mem_ctx, struct ctdb_context *ctdb,
>                  return ret;
>          }
> 
> -       return 0;
> +       /*
> +        * It isn't strictly necessary to wait until takeover runs are
> +        * re-enabled but doing so can't hurt.
> +        */
> +       ret = disable_takeover_runs(mem_ctx,
> +                                   ctdb,
> +                                   0,
> +                                   connected_pnn,
> +                                   connected_count);
> +       if (ret != 0) {
> +               fprintf(stderr, "Failed to enable takeover runs\n");
> +               return ret;
> +       }
> 
> Message should be "Failed to disable takeover runs\n" like previous change at 3886.

This is a bit confusing but correct, the function name is strange.

We have "disable" with a timeout of 2*options.timelimit
and "enable" with a timeout of 0.

metze

