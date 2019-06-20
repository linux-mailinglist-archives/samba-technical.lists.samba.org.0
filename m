Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B2E4C5BD
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 05:20:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=bp34zPIUrb71nTEsb/w2CaqKtLsW0ovydoMfUVQfX2g=; b=pkIGQVMRIf2n4si2ZQj0yLRpAd
	N7iY+kNofYZzqQFa4PLtzQ+ILnquMx4Xb1br6tMkl0hG0CyfhF1vrkRfdS7x4toO/NaGQ5xoDtC/+
	OKy8cw+5TITSw3WiZYCXDI5C9dwGhYyamzRddAuFfRKRYL2unG8AgJIj8T8bkKcpPbVnW0UNLYiKK
	eU3SNXtBa6pIDuaf2LHglOFuiNsp/GP31dmubw6i5+bZjtJ6RSYc8LEEp0+cqYZ0iDb2GeQWatxF2
	vbUXQFzOQiSZunV84n91yomBhs+uqjstEQDoPOTKJXEVYK4W4gfdXKAQByuotKzpKug8FHg3Q0VeI
	DH7hhI4A==;
Received: from localhost ([::1]:44952 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdnc5-000ZeD-9V; Thu, 20 Jun 2019 03:19:49 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41265) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hdnc1-000Ze6-5t
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 03:19:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id y72so772503pgd.8
 for <samba-technical@lists.samba.org>; Wed, 19 Jun 2019 20:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bp34zPIUrb71nTEsb/w2CaqKtLsW0ovydoMfUVQfX2g=;
 b=IoBozTWI6WtiCJTjV5NVr5SK0AA+MX+bIezWwVENPB0FtS2bmHKNJgOcVwI1rGC2NG
 o7W5ibrgd/z/Id8BgHBLmMTCedwScz4+Wir2UsunN9Y2LMH86ssriAp2TJ7p6Adjd6Yy
 lrIbD3oPOA0f4HTfhowdSMHII3y2arp4w44aXs1cOND1cQFZPIV417K8U+aRDAoTV9fj
 J2zn6+8EIoQFCi2A8k1eoBhS1Vr7NFvx2DlmlWlBHg6Wd5nObXQaqaft151jJ8qdSBjo
 OH8xQWYk7UOdRnYdQpCUBhrkW9QpmFc5DZIKOtlyFkC+KVEV+NSoZDdgEukFIJ1mqQfv
 hlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bp34zPIUrb71nTEsb/w2CaqKtLsW0ovydoMfUVQfX2g=;
 b=grY/5v2/y8FSPn7POj9Gt2009j+ak8Yx9Ar3KJun+TrQaZJSKIWR0ipLDKsatcdtwE
 Oe1htZRR/I4TjNEKSw3fDIXPIleILMyeS23WMfp8tH1Fr405icLluXlaZLeKME7GwIhU
 k2VLn6PXQMggQFwTuT25mGTM9c1xhkimJYknLnAcxjynfP8eurcekxu8rORxagJ9y84t
 mDRkBy9M3iVDya3bDOxwswdgRSRreQ+n4uUAAxaARuuHFGqq8bT9jCLxNVOSgUB+Bta3
 RlYzGBFvPqfmRYX7uUDz9mhIzPjRfZWN5OLplPOpCAA/EK/aYJOG6IdJLTSGf33JG3GD
 huBA==
X-Gm-Message-State: APjAAAXhE7cM1pzfWqBFpIAGIZ7YvtSl7i9jOhqEMmxl2rdovy6WgVGT
 EG8jW9rDb7a2orc7HFoJVOioQB/JXIpF6irCesY=
X-Google-Smtp-Source: APXvYqzEK2SNsIPuAc7sDwFOPRdq0DtDw6mtbAEdjPlm8oUqc+2nDmjR1fPIQakln4aYopalNBSAEzkB7czYW5LSYZc=
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr653250pjb.138.1561000781617; 
 Wed, 19 Jun 2019 20:19:41 -0700 (PDT)
MIME-Version: 1.0
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAN05THSoKCKCFXkzfSiKC0XUb3R1S3B9nc2b9B+8ksKDn+NE_A@mail.gmail.com>
In-Reply-To: <CAN05THSoKCKCFXkzfSiKC0XUb3R1S3B9nc2b9B+8ksKDn+NE_A@mail.gmail.com>
Date: Wed, 19 Jun 2019 22:19:30 -0500
Message-ID: <CAH2r5mu0kZFhOyg3sXw6NVaAjyVGKuNdRGP=r_MoKqtJSqXJbw@mail.gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
To: ronnie sahlberg <ronniesahlberg@gmail.com>
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Local file systems that I tried, seem to agree with xfstest and return
0 if you try to copy beyond end of src file but do create a zero
length target file

On Wed, Jun 19, 2019 at 9:14 PM ronnie sahlberg
<ronniesahlberg@gmail.com> wrote:
>
> On Thu, Jun 20, 2019 at 11:45 AM Steve French via samba-technical
> <samba-technical@lists.samba.org> wrote:
> >
> > Patch attached fixes the case where copy_file_range over an SMB3 mount
> > tries to go beyond the end of file of the source file.  This fixes
> > xfstests generic/430 and generic/431
> >
> > Amir's patches had added a similar change in the VFS layer, but
> > presumably harmless to have the check in cifs.ko as well to ensure
> > that we don't try to copy beyond end of the source file (otherwise
> > SMB3 servers will return an error on copychunk rather than doing the
> > partial copy (up to end of the source file) that copy_file_range
> > expects).
>
> + if (src_off >= inode->i_size) {
> + cifs_dbg(FYI, "nothing to do on copychunk\n");
> + goto cchunk_out; /* nothing to do */
> + } else if (src_off + len > inode->i_size) {
> + /* consider adding check to see if src oplocked */
> + len = inode->i_size - src_off;
> + cifs_dbg(FYI, "adjust copychunk len %lld less\n", len);
> + }
>
> This makes us return rc == 0 when this triggers. Is that what we want?
> Looking at "man copy_file_range" suggests we should return -EINVAL in
> both these cases.
>
>
>
> >
> >
> >
> > --
> > Thanks,
> >
> > Steve



-- 
Thanks,

Steve

