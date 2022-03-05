Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A7BB54CE7A6
	for <lists+samba-technical@lfdr.de>; Sun,  6 Mar 2022 00:26:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wzzC/cR+mJ6QnmHJL5fFhu4LhN1tjZezVLhuzBOSXdo=; b=gjSIScHqV0BVflRoL0WVtZkXiC
	W0JhnBLTgmzLatKH4uW4MqIuild/5c+31UvaaSxpVooDnHRQ2xlHYXozXtefGnZtPaduGzKNP4Gn0
	wSve+ez9E8uA9FvceYtVCK9Comj1WcM+OOtxIzBuYp3S+hFD71fjrfFt3kNnOVpOXeQi2ssPvX9xJ
	SJpSy26fEWPjoN16AuayhXJ8kHmhY6q1QslPCiaHObYRTkJZLIZm9qgwIaqJ7z92+VkYDIRE5WqEq
	itMQX0AAQviHDAGT34Jy8rqerE8jLpManPaVYhsI/V+9Hlx8p+QqBhLiV2lFjzJ8JdHxWDJvrX+7W
	gZKg3snA==;
Received: from ip6-localhost ([::1]:25448 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nQdmN-00GCeT-7p; Sat, 05 Mar 2022 23:25:39 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:49440) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nQdmI-00GCeJ-FV
 for samba-technical@lists.samba.org; Sat, 05 Mar 2022 23:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=wzzC/cR+mJ6QnmHJL5fFhu4LhN1tjZezVLhuzBOSXdo=; b=XFnaIKQ3y7BodO45u5tlphW/7w
 VeRdgZvvhXy8KA1DhnElSK+LofVroiJW/C3jprB5xB/eXgBOyd9XpxjTJMD3MjO/w0ifhSYm/WdeP
 1QprA05mqdYJuL9Q51OtuKmp8TNV/Pb5LDouuK0Ig0AOzk3u+dmZKQrgyufBElm642oV7EjXIIm5r
 tL0u6JS1T7RK2GgN7+oq0/dlMYUKJYMl+7nHFo/PaXrO04g43FK28RWbAgg7ZDBFp51vERV0xbJs/
 ItTPoUNK7TcMaY1mSOZK+E3/SPpDtAegmQyeeX+zHt6OTUb/5kXtVwq5QMbgaFdUj+lFAJZBCwKVS
 MwRSxZBiHxCaes6La8veiW4rntyJJRawQqqGO3kjclFt+VtQ1HoE9kt4ySQCpn9v79s1wn+MkReVK
 AcfWdAb/tpRv5eSGVr5iyAEt18lxWMyOQ1TnkMguhGNMZzMbOejrfu1Ztouv+elhY9tvfFckaCqb2
 2Kbt3oHsloY8M4O49740rlCe;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1nQdmF-006th8-LD; Sat, 05 Mar 2022 23:25:32 +0000
Date: Sat, 5 Mar 2022 15:25:27 -0800
To: samba-technical <samba-technical@lists.samba.org>
Subject: Re: issues with 4.10.16 UnixWare port
Message-ID: <YiPxZ932JA9XwN0v@jeremy-acer>
References: <alpine.UW2.2.11.2203040933550.4550@server01.int.multitalents.net>
 <3d52d8c4423ac247d09600c34ea499670b2c6a4a.camel@samba.org>
 <alpine.UW2.2.11.2203041738580.17423@server01.int.multitalents.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <alpine.UW2.2.11.2203041738580.17423@server01.int.multitalents.net>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: Tim Rice <tim@multitalents.net>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Mar 04, 2022 at 06:22:02PM -0800, Tim Rice via samba-technical wrote:
>
>Right, UW does not have xattrs. As near as I can tell, neither does
>Solaris or FreeBSD. Is AD DC a Linux only thing?

Both Solaris and FreeBSD have xattrs. The interfaces
for them are different to Linux but are mapped to look
the same.

Look inside lib/replace/xattr.c

