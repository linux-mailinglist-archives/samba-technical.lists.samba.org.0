Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDB85B3262
	for <lists+samba-technical@lfdr.de>; Fri,  9 Sep 2022 10:54:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=8gvmorE98i+NbkrFMsqCeBUHFTfzSvk3SXUNqXxlU8g=; b=Nx4DCLZfgOTJkiZ5AxvHLfsm1i
	+ySJpnKamkPbRFyqqdFD+CaFXr1DIpJiQ299trc/KaxpsvspwZNHi+CGUeTTp8derP/o2YVNCtcnh
	Qh9bYqaQCDSF0tJXZzDWRaX46Z7IX3jEk5A068ltJvj4hw6B2QRwIJ6HzcDHBwYYiG/T2oIqTbl0N
	4nHTwsEzwZMwqEAZlQ0UCyCY+pUukhj5cXqfrSLpRTbAUoQlfk78Khnx4UH3olp/Ofr0Gzb3e9wxY
	3CjKp8BSmXIGAG7uug6lGH1bh/G/4nbNmMuUGcb6x/YCpitsV3o2r5PaD/FNJ32A5je7ycfxrsy5y
	66qgU9/w==;
Received: from ip6-localhost ([::1]:18548 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oWZm5-0005PS-UV; Fri, 09 Sep 2022 08:54:10 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:39224) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oWZlz-0005PF-4O; Fri, 09 Sep 2022 08:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=8gvmorE98i+NbkrFMsqCeBUHFTfzSvk3SXUNqXxlU8g=; b=LwD8yAuS8xpe9Bo0knJMUKKaod
 1+Vg26VL1PyLobOS/M+lhc/e6/cq0eMf1+BhrhlYlD9fbTkrr3Su9RjLIkiUTPotSqavIdnjzixjq
 lV24fskc9MQA6j6nVCmOpNwqc1yWUWCW+9Zs3+PfiFSDrBUCvfXpf/4JYU4miqmnxJJOAQ3sz8Kgg
 QtomJ46d4Q2qKm/t92qKWc8YfgGC3XgjnKBb5twjhovpc3XGzpjiE6zI/NHA7hOFqz5c7SuoPzszi
 0Q43aP7NoS7lz60TD7IVjm2FxDlVPqOdkjZy0WykB7s9H6lc5IkNMW1/J9UQiwHtPbGWjywJcoW8E
 2pDefWXXUbODqD1Otgzdwt4BsSJvSO9CeggtuiSQ8LRQTTq/Fx+mcuv1wauNwPjz6pbX/4WaKGyFQ
 84GsJKDeluTLbcS1vq9QrvLcixp3YuXM6MheNPBM0i86x5G0cHnoP5oMYPmVBDge7smzEK2odGB25
 tY+WAz0M5X8fdFI5H/n9M8Fn;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oWZlo-0004xc-36; Fri, 09 Sep 2022 08:53:52 +0000
Message-ID: <cf16b3cd-dd4d-b317-98a2-d559b0dbb378@samba.org>
Date: Fri, 9 Sep 2022 10:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: s4:kdc: Set kerberos debug class for kdc service (Re: [SCM] Samba
 Shared Repository - branch master updated)
Content-Language: en-US
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org,
 Andreas Schneider <asn@samba.org>, Andrew Bartlett <abartlet@samba.org>,
 Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
References: <E1oWR2z-007u9m-Tl@hrx0.samba.org>
In-Reply-To: <E1oWR2z-007u9m-Tl@hrx0.samba.org>
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

Hi Andreas,

> - Log -----------------------------------------------------------------
> commit 761ce8cfe41139ab5656dec5cc05f2f576095216
> Author: Andreas Schneider <asn@samba.org>
> Date:   Tue Sep 6 10:19:54 2022 +0200
> 
>      s4:kdc: Set kerberos debug class for kdc service
>      
>      Signed-off-by: Andreas Schneider <asn@samba.org>
>      Reviewed-by: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
>      Reviewed-by: Andrew Bartlett <abartlet@samba.org>

Can we please do this for all files under source4/kdc ?

metze

