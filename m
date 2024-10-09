Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 362EA99764D
	for <lists+samba-technical@lfdr.de>; Wed,  9 Oct 2024 22:19:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=QaVLAkrJugxTzf6dmwDHu8zNovSnPaVTIcAZesgH8I8=; b=BACECVft7YShX78wBBS1ESULVF
	/ht/ACLZpa81rPyke5A43pibWummSlTmoz03ES/GIhKsCuGw9IruOKEnYyyrjc2KhZGazmmg0cWRX
	ujtlatvHo80967sOmdUU+4niwpy57ZYIdNEfiLZvATfMxFaxn1/PEQMNGNyp+Zokok/T2LyiO65yk
	XcN2nG59zrDSRkQ2TREeL6XuIHMheC7HK2Lg9zqrkWhnXEE8+ibek2V+kcR4iRlcEGaeIpbnPM9SB
	fUTK0aKtjgfcj5XMbwTYG3XmqaPTDFX5Nu+pcpgMdZ8CIYRdmyDcZSY/KV34I4QN/9xUJX1Q+HroM
	5GYYxDvA==;
Received: from ip6-localhost ([::1]:57552 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1syd9C-003Pe4-D2; Wed, 09 Oct 2024 20:19:02 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:11514) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1syd96-003Pdt-V7
 for samba-technical@lists.samba.org; Wed, 09 Oct 2024 20:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=QaVLAkrJugxTzf6dmwDHu8zNovSnPaVTIcAZesgH8I8=; b=ZhMS9/aw5KNgf+QEPDJ+aqda+t
 nMbDevJ7sUGWNvsr2xaiqcONL3ENNgTMpcFDi7gX9szFeZ0cT1sfz6hAQ4n9DzD+i1KUV4DapQDVB
 CeyiLAP6uVB+DNnMWYlhUZKiNH2k8pcen33WwBXazsQq9eUOKNF3qcI+7GvF/rUY4tw0aB1TlC0Fo
 QygKVvzEklOXA2JZfPzdL6LvRAVh5oaQZk7VTHsBKqdMkh37S/oWDWmZ37ot1nmAER3o48Q/5sKpV
 vHEWjxshluRD0/TUK2NWA7vCIAG2pY2LGa74+zcI0k05fF0kbDEqw1+Z+ISoBgbbtu+LXrU+IXOEw
 BeUhZJcIUOL8LxOIFp1O5eS/q4M9PP7MgOqu3J7bdXMfLMqgqBje++IJf6h86VUNFUjBPTXIA02Rn
 YuVvV3r01RRKAbMINhj1Lq36hEQgdrtvDycU9zWLv6m1VXZ+l+3NjcVm64Ev7cM/4pQ/QsUX2d8VY
 hQJw4VAxK+07aSx/IzgnPqKI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1syd95-0046CH-2v; Wed, 09 Oct 2024 20:18:56 +0000
Date: Wed, 9 Oct 2024 13:18:53 -0700
To: Ralph Boehme <slow@samba.org>
Subject: Re: Current Samba master incorrectly returns STATUS_INVALID_HANDLE
 on copy_chunk
Message-ID: <ZwblLYrVQM92eFl8@jeremy-HP-Z840-Workstation>
References: <CAH2r5mt7cE8Cc2K5K8nRM2RL=R-rwuAR9h6SSyEqtApuochtuQ@mail.gmail.com>
 <e12d7594-02df-4cbb-80fc-276d907afd90@samba.org>
 <CAH2r5muqSmNy+3SViFKNJ=5Sm61u8r9ej9Wy8JLUDeC2XHwccA@mail.gmail.com>
 <77aff6ef-291d-4840-82e2-b02646949541@samba.org>
 <d84732db-dea1-4fbd-9fc9-105c115c9ca0@samba.org>
 <990b4f16-2f5a-49ab-8a14-8b1f3cee94dc@samba.org>
 <ZwVM1-C0kBfJzNfM@jeremy-HP-Z840-Workstation>
 <569625f6-e0d2-43db-88cf-eb0fff6eb70e@samba.org>
 <ZwbczZYBsTU03Ycv@jeremy-HP-Z840-Workstation>
 <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b84b2bb0-0afe-4f9e-9553-1a0201ed92d3@samba.org>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Oct 09, 2024 at 10:00:01PM +0200, Ralph Boehme via samba-technical wrote:
>
>Hm, interesting find
>
>But I guess this won't help as with POSIX you can open() a file with 
>O_APPEND but then still call pread/pwrite on the resulting fd.

Is that true ?

The open(2) man page only says:

        O_APPEND
               The file is opened in append mode.  Before each write(2), the file offset is positioned at the end of
               the file, as if with lseek(2).  The modification of the file offset and the write operation are  per‐
               formed as a single atomic step.

Aha ! It's not true (at least on Linux :-).

The pwrite(2) man page says:

BUGS
        POSIX requires that opening a file with the O_APPEND flag should have no effect on  the  location  at  which
        pwrite()  writes  data.   However, on Linux, if a file is opened with O_APPEND, pwrite() appends data to the
        end of the file, regardless of the value of offset.

So FILE_APPEND_DATA|SYNCHRONIZE == O_APPEND, on Linux at least.


