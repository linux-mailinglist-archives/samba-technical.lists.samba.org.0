Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D724704FB
	for <lists+samba-technical@lfdr.de>; Fri, 10 Dec 2021 16:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eksus8VYegBXQqg8/ehAYqSReLaB5XPXwjr2+UdtAPo=; b=EljTgHGSVZGoCKW+5kBduduz1M
	77eEM/gwlBtYK9u1Q+EUDqR2qAH5/uyfsPbKcqfnOX//nDSnsxbcDD3RizsYO/H4WeUvdavWVgqC3
	LWa7/s2L2eLwjZxyhZUKD/2Nsd8UNO23zrHxfIRf2GzemlgBJEGcteaxy/dZzgNhqS8S6DRqB6OS0
	N5RgdcV5ej+1rk2yRrUVPpf0ci8qEGqv/X+Am6bplHxEcwRVv6qHVOozMbMZxXIU32DzUiNsVu9MC
	Bm7RmV4hx+Pef5z9X/ujhFj+nGCjuOHIoREhRh5DrAqy0LHrKcD2nphS85j8WpVK2pPQPNoiwtlzf
	ChGJbJ4Q==;
Received: from ip6-localhost ([::1]:29088 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mviDr-004xnR-31; Fri, 10 Dec 2021 15:54:11 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:40582) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1mviDl-004xnH-5Z
 for samba-technical@lists.samba.org; Fri, 10 Dec 2021 15:54:07 +0000
Received: by mail-ed1-x530.google.com with SMTP id r25so30871236edq.7
 for <samba-technical@lists.samba.org>; Fri, 10 Dec 2021 07:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ixsystems.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4YI9QXCbYvGzb1hL++LozKV1IJaWjUzEB1BzJoC3q1s=;
 b=TR/ZmWnyBItoJKY44YBxCYDobaGovatdS67QHnRjMx53LTduS+Vy07WT7ttHtdJXdx
 a72+d3OSVOIECnYAHY1uglIh6hzM0RDqwRARhGULd/cmdng/LrnxbTAA0TYbaQq5+x6V
 7Ao6rfq5Pg8sF16/vPwQBEj7vbfwR+9U99uULi9epsj6i6/lAPYTiSrs+orcUR/CaG4L
 bn6YwjLrOvPpnRlcbG+MI0HYnmpGitAcE+ytusSD3qk/yBIrCeStdwcN+u3MH/iji3fc
 zpcudM/k3YO3EIm2nwvDOWCURnuUNnYGQkI09bZ4bmVHcE7IwKSZgXdDJEGcqnvM7WmV
 4H8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4YI9QXCbYvGzb1hL++LozKV1IJaWjUzEB1BzJoC3q1s=;
 b=QQUGgvluFDC2lVuryedYRf+sQ/qq+Z/PvLVP/zkp5PqdK8sAcqev0NlpSSDp0teVqy
 EUZ5M/uMyfCp8LJAA/7Y63vCDDu9Qn16adfNNWZw8w6HcLqjXlYhmj3Z8LCB+FH6Ho4d
 DRSaLcyEjm8fVWH4kdBRs3MmD6x3yHyH4/A6N835cuYeTOBhAq3JhCWYuWySVIat88CM
 0UHWwkzik1NppoVvDSoM8wmg6XRcJDBublqrBqkrci7cBmJbbH+q1VU+JD/F21an8Nuu
 9/w1Q2rwa1HheEuksQ62CfC6OiaZ4zCz1qIopRGQs2pB5PbH1ch/pyr7JcOVB4vBah8m
 gZhg==
X-Gm-Message-State: AOAM533Hu8Yvis5lGGwtOz1p0FwVpbWzNKFOby3XLVw8wtO7jloAztic
 u49qNf8bNe7AkpzrM+6+AzjqBQWFqfMqU32WOEd4UPuChZla5w==
X-Google-Smtp-Source: ABdhPJwjoVXGZ/d0cJbVty5Xs9W0U8b+ZBTJy+4UtnO1H1ua0jgmS9G4C4GbAniRNhQ8j8/SWmsCyh8gTjzoVcCuPSA=
X-Received: by 2002:a05:6402:3596:: with SMTP id
 y22mr40353722edc.297.1639151640905; 
 Fri, 10 Dec 2021 07:54:00 -0800 (PST)
MIME-Version: 1.0
References: <CH2PR12MB4152F65AF85E23297EB5146D9F6E9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <d37f9e09-fdca-07c8-ac5c-b5e859930b9e@samba.org>
 <CH2PR12MB415202EB8137713529ECEF6E9F6F9@CH2PR12MB4152.namprd12.prod.outlook.com>
 <1cd1e3f9-1773-2ba9-24f2-f7a0c4f49cbd@talpey.com>
 <5f6cc5cf-55ee-8422-b284-bd45b8faf448@samba.org>
 <84a566c0-4b04-eafd-89f4-d636ff655371@talpey.com>
 <93cc9a8b-8404-f5a1-3615-62919be31e69@samba.org>
 <fdbdbd51-92cf-d424-655f-fca636583e13@talpey.com>
 <CAB5c7xqZcK9-Oa+o+w5Mva9Dr8_wWojx=krWiP+4zQ0X3ksH+Q@mail.gmail.com>
 <6c8aca36-8856-cf8a-2ea9-902106d0adc3@talpey.com>
 <a25972a3-3688-367b-fcab-fa748e590153@samba.org>
 <CAB5c7xp-zEwjcZSHfjL8YyWd_4y=K3HC3GSjAzvMoJR9aPOv6A@mail.gmail.com>
 <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
In-Reply-To: <9bbb9a27-9100-9a61-50e3-bdc7ab0bab1a@samba.org>
Date: Fri, 10 Dec 2021 10:53:49 -0500
Message-ID: <CAB5c7xpys+Ch65-6v0qv6rtGonFcKkMKJRYEzOboiRfiOPLs4Q@mail.gmail.com>
Subject: Re: Duplicate SMB file_ids leading to Windows client cache poisoning
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Walker via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Walker <awalker@ixsystems.com>
Cc: Tom Talpey <tom@talpey.com>,
 "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Dec 10, 2021 at 8:18 AM Ralph Boehme <slow@samba.org> wrote:

> On 12/10/21 12:49, Andrew Walker wrote:
> exactly. Thanks for digging out the references. Didn't remember I ever
> wrote such a comprehensive summary. :)
>

Took a little digging to find it :)


> So what shall we do? Back to inode numbers? I've been recommending
> fruit:zero_file_id=yes to customers who've been reporting strange issues
> with Mac clients. That causes Samba to return 0 file-ids which has been
> problematic in the past, but it seems to be working atm.
>


Looking through latest MacOS SMB code that I have on hand (which is _very_
old - smb-759.40.1 / Yosemite), zero file caused MacOS
SMB client to determine that file IDs are not supported by the SMB server,
which looks like it causes node lookups to be caused by
hash of filename rather than inode number...  see comments in
`kernel/smbfs/smbfs_io.c` and smbfs_hash() in `kernel/smbfs/smbfs_node.c`.

```
                                /*
                                 * Some applications use the inode as a
marker and expect it to
                                 * be persistent. If file IDs are not
supported by the server,
                                 * then our inode numbers are created by
hashing the name and
                                 * adding the parent inode number. Once a
node is created we
                                 * should try to keep the same inode number
through out its
                                 * life. The smbfs_nget will either create
the node or
                                 * return one found in the hash table. The
one that gets created
                                 * will use ctx->f_attr.fa_ino, but if its
in our hash table it
                                 * will have its original number. So in
either case set the file
                                 * number to the inode number that was used
when the node was
                                 * created.
                                 */
```

That seems annoying, but the MacOS source is also quite old. Do we know
that there are still issues with MacOS when an inode is reused during the
lifetime of an SMB session? Do we have an easy way to reproduce the MacOS
issue? Perhaps if we can determine that the issue only impacts legacy
versions of MacOS we can go back to just returning the inode and tell
people with EOL MacOS to upgrade :)

Just spitballing here, but what's the downside of just including the
current inode number in the file_id we're generating? (Trying to think of
what we can do that's minimally invasive).
```
diff --git a/source3/lib/file_id.c b/source3/lib/file_id.c
index 6bfcf1463d2..8f3d76e66f9 100644
--- a/source3/lib/file_id.c
+++ b/source3/lib/file_id.c
@@ -113,6 +113,7 @@ uint64_t make_file_id_from_itime(const struct stat_ex
*st)
        file_id = ((uint64_t)1) << 63;
        file_id |= (uint64_t)itime.tv_sec << 30;
        file_id |= file_id_low;
+       file_id |= ino;

        return file_id;
 }
```


> Tom, do you know if it using any of the mentioned fallbacks from MS-FSCC:
>
>    For file systems that do not support a 64-bit file ID,
>    this field MUST be set to 0, and MUST be ignored.
>
>    For files for which a unique 64-bit file ID cannot be
>    established, this field MUST be set to 0xffffffffffffffff,
>    and MUST be ignored.
>
> would be a way forward? Macs can deal with 0, not sure about UINT64_MAX.
>
> Thanks!
> -slow
>

This seems to be rather extreme for what is putatively a MacOS client issue.
