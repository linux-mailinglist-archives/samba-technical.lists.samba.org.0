Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E6D2F9699
	for <lists+samba-technical@lfdr.de>; Mon, 18 Jan 2021 01:33:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=xv/WlV/7tAGzsqAFYJNxbvnztWyBb7q8qsHsoXg1nTE=; b=V09PFYHa0izANW2p9LPOCIUlKP
	iWGUK4MRptEkCygjdAMaOIkkmrfQtrCSjlAv7hseHri1QPUf2kx9pria96xbak6VNmWRpl/TlaNb+
	FkxcnFHr60LGgh9OG/elQ09u8Bu6t7O+FeCVqa+SKrQOOyTQrV65lDxkh0mVoh/c97n0muOZ/MN6Q
	l6dowNG+pHcM47c0PSXK6EPSZaWE8INXWLLnY4rpKsBVQpONUK8M1JczPxg+wqU7GAfUv73g3IUgu
	QYoRRtgFXSCxe2F1sP0E10mNs0UvtWxuwSXVSNB6g2Y4xrZLHhp7EtRug8SXv6d627IcXUWE8Dfn3
	Cn++r4DA==;
Received: from ip6-localhost ([::1]:29584 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l1ITJ-00606G-84; Mon, 18 Jan 2021 00:32:41 +0000
Received: from zeniv.linux.org.uk ([2002:c35c:fd02::1]:60338) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l1ITD-006069-Sj
 for samba-technical@lists.samba.org; Mon, 18 Jan 2021 00:32:38 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1l1HzU-00BADM-Tn; Mon, 18 Jan 2021 00:01:53 +0000
Date: Mon, 18 Jan 2021 00:01:52 +0000
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH] fs/cifs: Replace one-element array with flexible-array
 member.
Message-ID: <20210118000152.GH3579531@ZenIV.linux.org.uk>
References: <1610615171-68296-1-git-send-email-abaci-bugfix@linux.alibaba.com>
 <87czy7lvjy.fsf@suse.com>
 <CAH2r5mvjDAgB6-kE=AOAwrETVk+R79z6Gd8gMnOTWqG-6Mnybw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mvjDAgB6-kE=AOAwrETVk+R79z6Gd8gMnOTWqG-6Mnybw@mail.gmail.com>
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
From: Al Viro via samba-technical <samba-technical@lists.samba.org>
Reply-To: Al Viro <viro@zeniv.linux.org.uk>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 Jiapeng Zhong <abaci-bugfix@linux.alibaba.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, Jan 17, 2021 at 03:58:23PM -0600, Steve French wrote:
> Jiapeng,
> Aurelien is correct, you should respin this patch and correct for
> where it breaks the sizeof calculation.  For example your change:
> 
> struct smb2_lock_rsp {
> @@ -1434,7 +1434,7 @@ struct smb2_query_directory_req {
>         __le16 FileNameOffset;
>         __le16 FileNameLength;
>         __le32 OutputBufferLength;
> -       __u8   Buffer[1];
> +       __u8   Buffer[];
>  } __packed;
> 
> would have the side effect of making the file name off by one:
> 
> smb2pdu.c-4654- req->FileNameOffset =
> smb2pdu.c:4655:         cpu_to_le16(sizeof(struct
> smb2_query_directory_req) - 1);

FWIW, that sizeof() - 1 should've been offsetof()...

