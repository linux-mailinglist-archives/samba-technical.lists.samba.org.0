Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8CB33D4C7
	for <lists+samba-technical@lfdr.de>; Tue, 16 Mar 2021 14:24:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=fLqMOIz4rQaZzQ7DUiZZsHLfS9IEtvnkuPfckFA7GQE=; b=wsZEmAkmjZNGQzvJakw4QXcLj9
	WSemWe3ej1A6j504gKLJc5LD0qGQP+6QC4r9pBuoBv/ySFHJiDb75PKQ1L8AACaU7HTwX/8IWqOT9
	CCrPZEciO2uuspvAvb/wKIpphZ8HWJV62GaX56CoY1fSZqm4HaZ1alWyPbf+VPLecokrvlKc98cfn
	l+SwClwBgA9vcopoS2kSBwITdtmy2WuAfZJXXELN1gAB4lEm1P27cmtWcwkpyuaWKaTGiKUJZagS3
	Uzxq9+7kU2MWlQ4US6L/422s4Uhv+mVnBh/u5yhhne6An5Hu4pcGNBcvm0UxXAXOq9+gPEsAl74da
	a2s08khw==;
Received: from ip6-localhost ([::1]:20970 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lM9fh-005hRn-GS; Tue, 16 Mar 2021 13:23:41 +0000
Received: from p3plsmtpa06-05.prod.phx3.secureserver.net
 ([173.201.192.106]:54543) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lM9fc-005hRg-JG
 for samba-technical@lists.samba.org; Tue, 16 Mar 2021 13:23:38 +0000
Received: from [192.168.0.116] ([71.184.94.153]) by :SMTPAUTH: with ESMTPSA
 id M9dMlgHaS3MqEM9dMlKzyY; Tue, 16 Mar 2021 06:21:17 -0700
X-CMAE-Analysis: v=2.4 cv=Ztool/3G c=1 sm=1 tr=0 ts=6050b0cd
 a=vbvdVb1zh1xTTaY8rfQfKQ==:117 a=vbvdVb1zh1xTTaY8rfQfKQ==:17
 a=IkcTkHD0fZMA:10 a=3-RhneuVAAAA:8 a=I0sF1hZwEO2LTmVZMWkA:9 a=QEXdDO2ut3YA:10
 a=VLVLkjT_5ZicWzSuYqSo:22
X-SECURESERVER-ACCT: tom@talpey.com
Subject: Re: [PATCH v2] cifs: Silently ignore unknown oplock break handle
To: Vincent Whitchurch <vincent.whitchurch@axis.com>,
 Steve French <sfrench@samba.org>
References: <20210316124808.11984-1-vincent.whitchurch@axis.com>
Message-ID: <93d506a6-5832-5006-3bab-6e8e7203da0e@talpey.com>
Date: Tue, 16 Mar 2021 09:21:16 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20210316124808.11984-1-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfMHiaaShf7isCN2tOasRztRt/9PCFV+2jq8EBDYO7Ap6X6hTfBIFUzM6i/rnZIMWwGgFls9g5pFUgKSM/51XYcBFst/vZ3rb4vRgkOJEUqpqbzLCipAW
 WmMkyxfHvSyYL+MUI8uNfp+WTbMdDRY75ZBxsszYxC5HArz2hrCaHFY/AST5YwU/fWlkIvUGNZDBE2aa1uyslwsSwWEouAYj8q2MNT1lE8j3Q5ESN10/Eeoe
 XTfzS5bZYtCO0FiVmK/ZFyqgrXnoKat5F/5as8yQuuAhmyq7GiXGkG5y+LdHMZp+IkqydvIhYi1CnlrlDd2pRMwkgBBXlSZxKpP4ef59CexKEjFVv1Z4GASe
 X8pr/wnmw0VcuNIQRsclje+8HlBH4g==
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
From: Tom Talpey via samba-technical <samba-technical@lists.samba.org>
Reply-To: Tom Talpey <tom@talpey.com>
Cc: linux-cifs@vger.kernel.org, kernel@axis.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 3/16/2021 8:48 AM, Vincent Whitchurch via samba-technical wrote:
> Make SMB2 not print out an error when an oplock break is received for an
> unknown handle, similar to SMB1.  The SMB2 lease break path is not
> affected by this patch.
> 
> Without this, a program which writes to a file from one thread, and
> opens, reads, and writes the same file from another thread triggers the
> below errors several times a minute when run against a Samba server
> configured with "smb2 leases = no".
> 
>   CIFS: VFS: \\192.168.0.1 No task to wake, unknown frame received! NumMids 2
>   00000000: 424d53fe 00000040 00000000 00000012  .SMB@...........
>   00000010: 00000001 00000000 ffffffff ffffffff  ................
>   00000020: 00000000 00000000 00000000 00000000  ................
>   00000030: 00000000 00000000 00000000 00000000  ................
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>      v2:
>      - Drop change to lease break
>      - Rewrite commit message
> 
>   fs/cifs/smb2misc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/cifs/smb2misc.c b/fs/cifs/smb2misc.c
> index 60d4bd1eae2b..4d8576e202e3 100644
> --- a/fs/cifs/smb2misc.c
> +++ b/fs/cifs/smb2misc.c
> @@ -755,7 +755,7 @@ smb2_is_valid_oplock_break(char *buffer, struct TCP_Server_Info *server)
>   	}
>   	spin_unlock(&cifs_tcp_ses_lock);
>   	cifs_dbg(FYI, "Can not process oplock break for non-existent connection\n");
> -	return false;
> +	return true;
>   }
>   
>   void
> 

As an oplock-only approach, it looks good. But the old cifs_dbg message
"non-existent connection" is possibly misleading, since the connection
may be perfectly fine.

When breaking the loop successfully, the code emits
	cifs_dbg(FYI, "file id match, oplock break\n");
so perhaps
	cifs_dbg(FYI, "No file id matched, oplock break ignored\n");
?

Tom.

