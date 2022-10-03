Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABD75F2807
	for <lists+samba-technical@lfdr.de>; Mon,  3 Oct 2022 06:39:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=p1IQ4xWavzrSN1ZEsVWfDaCrop+YUwxoPLR9GRlbgO0=; b=tZ+4dpmKml1EePQcMzthaSabvx
	2rg4YYrgM7tkiRkCJcBao7cSdXQtvLXayVD4HmH/sHaiRr5mqM0+97rjqVatj3QiA6AQ/qf21HmHa
	MWh8OgEirq5HVyuocNpOg9pvs2vmEB3gylnBw9I9jOZeNraKNrJFxwCe2VuyyHec4AMR8pbhit0Bh
	7N/ycAWP4KOX6DOeycEidK/zoLJQPQIqasPz9V0U73xdOEG/Sa2rvZItYVUYuge31Pw+gX3qXTyF/
	sB4RED7URwt/5W+U/bDOqwG/ic27ygj6AAU1psE6ahAa5TdqJdMNol8MnMymu8ciUvgRGnq9v749a
	QIVLd5Bg==;
Received: from ip6-localhost ([::1]:31860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ofDDl-007FFk-PR; Mon, 03 Oct 2022 04:38:25 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:43752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ofDDe-007FFb-NO
 for samba-technical@lists.samba.org; Mon, 03 Oct 2022 04:38:23 +0000
Received: by mail-vk1-xa35.google.com with SMTP id g85so4883319vkf.10
 for <samba-technical@lists.samba.org>; Sun, 02 Oct 2022 21:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=p1IQ4xWavzrSN1ZEsVWfDaCrop+YUwxoPLR9GRlbgO0=;
 b=ZY/3NS5ODi8PsSDeSh9/s5BqdrerdaxpUb+77pxN/PTg9gEZuvKgIbGMIEK34S6vOl
 BSqtok+Lq+JJCMhsYY95+N1Lv1C62kz32pb4BDicpcys15XqinXjGBhxo9kF+ouOuxzD
 VcFNLpNxMqFV5ZJhRblFuiR6nd+2MhSFydkqVUyYKJCTHeD/nYGzwpTlTC2+As1J6ZAa
 /IGFXoC+X3xFFg4H9h9tbe/iIEftmT//7js68XK5ayzCv7YOi6kiUbPpU+zOepAK33Dq
 qM7BszVIF5ewp3aah/Xlk/ro00Snp3LeYJMaL8v70jLKxUUXf10rBIMAuLK88Wle6ga4
 UUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=p1IQ4xWavzrSN1ZEsVWfDaCrop+YUwxoPLR9GRlbgO0=;
 b=uWtYL8IBXBrhqCeEadQDZXEl8cwBN0F31bBBqxbEFnov3GcNTmpQweHfHm63YulkCw
 2+B++BysDCOJb6e9ESjPYsGozni/CbMyNdX8WlBY8v6Nw1MxsHLcnZfoKcQIMcTNcapP
 sin7dCa6u7XwzoAgGg8J8aGIBMa0rrRaZOqcRwgqe+fSuF1R3XnVPQKN+P+YZCGijTe8
 JodSzeaCaeuo+bzYYqyOU/lRUrava3oDPYTB+WhezrGqgRrl+PXZmiWlsSTZ+wYdbUmd
 QXVU56ngS44g8FweMazR07AjqMKfKD+1aD3HWpmMm7FLO8QLirYVEOnrcWH1fvefs4Pz
 Ztxw==
X-Gm-Message-State: ACrzQf1gxSaUXTrBWJF6KJP2nN7zOBDCGgBK+HVCzvxEfKECRue8GwNS
 K/KJkAnOQuVhos13rldXTjldkd0CbL3EejcDyAo=
X-Google-Smtp-Source: AMsMyM7nOMCkcJDlpOo6TnFiqBkt42JbSMsGNA98Eo5/M7WiXRRn9inNgwpdp9oSKyeXkwKqjeSSIkk5MZ7Ok4K2VeQ=
X-Received: by 2002:a05:6122:1043:b0:3a9:9506:c34e with SMTP id
 z3-20020a056122104300b003a99506c34emr3875908vkn.38.1664771895120; Sun, 02 Oct
 2022 21:38:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5mvS6_AXjbK8sY_dEWUbmtRjodSYEtxeNz_NST9+EyC96A@mail.gmail.com>
 <df473fde-e79d-ae90-37bb-3a3869d3aa9a@talpey.com>
In-Reply-To: <df473fde-e79d-ae90-37bb-3a3869d3aa9a@talpey.com>
Date: Sun, 2 Oct 2022 23:38:04 -0500
Message-ID: <CAH2r5msDX4eaGuyine__ePtOTRoSBDjiUN_dthaHpiA9UKm0yg@mail.gmail.com>
Subject: Re: [PATCH][smb3 client] log less confusing message on multichannel
 mounts to Samba when no interfaces returned
To: Tom Talpey <tom@talpey.com>
Content-Type: text/plain; charset="UTF-8"
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
From: Steve French via samba-technical <samba-technical@lists.samba.org>
Reply-To: Steve French <smfrench@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, Oct 1, 2022 at 6:22 PM Tom Talpey <tom@talpey.com> wrote:
>
> On 10/1/2022 12:54 PM, Steve French wrote:
> > Some servers can return an empty network interface list so, unless
> > multichannel is requested, no need to log an error for this, and
> > when multichannel is requested on mount but no interfaces, log
> > something less confusing.  For this case change
> >     parse_server_interfaces: malformed interface info
> > to
> >     empty network interface list returned by server
>
> Will this spam the log if it happens on every MC refresh (10 mins)?
> It might be helpful to identify the servername, too.

Yes - I just noticed that in this case (multichannel mount to Samba
where no valid interfaces) we log it every ten minutes.
Maybe best way to fix this is to change it to a log once error (with
server name is fine with me) since it is probably legal to return an
empty list (so not serious enough to be worth logging every ten
minutes) and in theory server could fix its interfaces later.



> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Steve French <stfrench@microsoft.com>
> >
> > See attached patch
> >



-- 
Thanks,

Steve

