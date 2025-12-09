Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A75CB16F1
	for <lists+samba-technical@lfdr.de>; Wed, 10 Dec 2025 00:41:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=eol7a1otwHvjyBvBv9DBEFIYPmlvmYWzkxkdqs2RWmE=; b=OTsS6deHN0tEgMwr/3MtrF5Wmu
	XzzTSd4HO7XlbHwnDGWqsAiDlxxSHmc8bbMI0Ni3z01/1UMBz6E7Yi5nAEJjWm2n+o7NTbko2JhUl
	HJSzXHlmrWttp17Jdqx3chDPXoXG+No7f7OjopmGS4X4Au80ZpfHAZE6fH3lXrs9esCL8n0xarec7
	q5DIQ00xcdTypBUIkyjW8beRT2W1WyQSdBgL9o6uAWkmDbJECsgJ1wkCNDeXRPbgzj5O/MrbH3A1D
	ttCB5TlcysESTaf+EbIB78xvN1qUBbChlqOw1BgoM7YseMNfujtVhtogG50aWyUsGpyuqWXOpBjW+
	N8UPJq3g==;
Received: from ip6-localhost ([::1]:48260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vT7Kd-00FxNz-PT; Tue, 09 Dec 2025 23:41:23 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36]:56533) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vT7KY-00FxNi-HE
 for samba-technical@lists.samba.org; Tue, 09 Dec 2025 23:41:21 +0000
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-882399d60baso56093956d6.0
 for <samba-technical@lists.samba.org>; Tue, 09 Dec 2025 15:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765323677; x=1765928477; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eol7a1otwHvjyBvBv9DBEFIYPmlvmYWzkxkdqs2RWmE=;
 b=NZvxYIp/yFMtwm2N27Mr1zH8MQYYB2LBAF+GBaXOTo7W8UsC/0X+LFCWJtKGLSBeSj
 cbsc6IqmXK3GocIaBkfPTTIZu5u8KRGdimz7ucTT19GCOLHWYtsg+aUaoquLFQOEDHtc
 phh4BeqQvdhZkzsK7lf9YcMqWaCP7CB8zRflOAWLLD/AtghQ0M8ILOUQX2gSaHOY3s5e
 s2QJUvUwc7GBnOpa/iqs5xAsMttXOjF8HyCMj5kwE3Ga2hB/fogvFkdIucVy4Sa0Sn4F
 VAHfA2XJg29BBg08ojMyoZQpwIIvu6IKW4K5xw5oHb+ZayLiA4b0XDa7gkxmb8uE+555
 3rzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765323677; x=1765928477;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eol7a1otwHvjyBvBv9DBEFIYPmlvmYWzkxkdqs2RWmE=;
 b=B6AYTtHKo46/VArjncU8K2TN42FvfAdRY4DXHsAe7DAHU6ez1po4x5DmmkFejPKmdE
 oMrFRzVPDU9LxmDETekwToajjF9O2+h3kam0/CDu6ThXRL1K4aEJVSuEVw1mvJFH3Vyf
 OmXkliVxlCvkBerSyNlngQqZERdDwmxUIDnKyNprHeklV5tMk4qc8Ka1As9A6bVA55N8
 X7fqQgWeWUuswadH7AymLOgpdGCQ6CIM2zPHDZfHfi1F0b1VbBAEI5by+zCY0kg5tIAM
 y4eZtB6KEfQuRkmnsDzalZtM5lX2j6gtoLLsQuedUzOYC/pmQgznAlymMd1R7mLH9fEq
 dOBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJTDnv+I/d0ju7ooZ5oV+VQrsVr0mAIY6Bwj/jkuVQfKXw/dA0akVD5nLrz19ZAqyqaxQ34mS2Zzlg2vL4HiE=@lists.samba.org
X-Gm-Message-State: AOJu0YxasQj6NpjoRu37ms5KusbBpuAxt1EepnFX5dhMUUUNmxDmlgM4
 fgZWBHDgsKppq+bM+42phb92ta9Qqr7WBPv586oup1QMrMKVTY5sXWXoAhZ5aFPIsqG1HosSDPt
 zQiZwezuBCdhJ2A3tAZYmS8VpqRxCAns=
X-Gm-Gg: AY/fxX6DmwBfIDGVHNflU/YUIAzyIqSn7CeyC9fbwvjrJbD9wcjgY8L8lAs2x5uMAoh
 auNUvukZgGR4QwcyBQ4dNTxfLftpm8J1xDBwdxmJGioS2wUux3CpcbJW2HbQr/MjOLByg9VdVg/
 WqppGXF3TJPvcAviRxvbRAix3Lihcij0GRFbhBPdyQ+PCtkAFCIqLwCl4auyRhUQ+DWvc+x9tXO
 cHkxYKFcvG9o/6iOYG2uTjFk/chwXP28OU3l4MXwe6tmobhgNuQhI3y7QD9YohAvy1eKsVXfexw
 PibKrM1MQTr6wHZi8MDRH5rCPbwsOY7N/9PNlMOCxzykw0dAyL7hVjYZoKwMFHdc+i7DK+xf5PS
 DRK1resX3AJBWly2WPkkSvsBXCIMMnvHj6ZZpo7wXjocHpZj8IP+Rfvm4W+4o6/TJ7nRhjQkQba
 D4HnzalEc=
X-Google-Smtp-Source: AGHT+IH42Y9jMF9Ybm6PN2AjrAz3LmpBej4NKEjOFolTxZUH6/Ywh7BxkXaqCBXy+lipcuJ9VY003XRl/1ZPyupV1Q0=
X-Received: by 2002:a05:6214:2a81:b0:882:437d:282d with SMTP id
 6a1803df08f44-88863a86b5cmr8841026d6.30.1765323676845; Tue, 09 Dec 2025
 15:41:16 -0800 (PST)
MIME-Version: 1.0
References: <20251208062100.3268777-1-chenxiaosong.chenxiaosong@linux.dev>
In-Reply-To: <20251208062100.3268777-1-chenxiaosong.chenxiaosong@linux.dev>
Date: Tue, 9 Dec 2025 17:41:05 -0600
X-Gm-Features: AQt7F2oXHR39caH7I73uR_kA-pVetWgyUVVWKj4yM8h7hQjnWT6try-qF04sxWU
Message-ID: <CAH2r5mvy6zoD3UKto6uOknFFMKCncJOPiDYqEUwKB_Zcpuj2pw@mail.gmail.com>
Subject: Re: [PATCH 00/30] smb: improve search speed of SMB1 maperror
To: chenxiaosong.chenxiaosong@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-cifs@vger.kernel.org, liuzhengyuan@kylinos.cn, liuyun01@kylinos.cn,
 samba-technical <samba-technical@lists.samba.org>,
 linux-kernel@vger.kernel.org, huhai@kylinos.cn,
 ChenXiaoSong <chenxiaosong@kylinos.cn>, linkinjeon@samba.org,
 linkinjeon@kernel.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Merged nine of the client patches from this series into cifs-2.6.git
for-next.  They looked safe.  Good catch on fixing some of these
incorrect error definitions.

a691ac0cdd97 (HEAD -> for-next, origin/for-next) smb: move
file_notify_information to common/fscc.h
c0fd2fbe4f73 smb: move SMB2 Notify Action Flags into common/smb2pdu.h
787a2b803211 smb: move notify completion filter flags into common/smb2pdu.h
14a6f0e19fc7 smb/client: add parentheses to NT error code definitions
containing bitwise OR operator
1e4c7c9ab176 smb: add documentation references for smb2 change notify
definitions
833f0f46368f smb/client: add 4 NT error code definitions
3a0a34572269 smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
954cbce76316 smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
b9695d00b605 smb/client: fix NT_STATUS_NO_DATA_DETECTED value
3d99347a2e1a (linus/master, linus/HEAD) Merge tag
'v6.19-rc-part1-smb3-client-fixes' of
git://git.samba.org/sfrench/cifs-2.6

On Mon, Dec 8, 2025 at 12:22=E2=80=AFAM <chenxiaosong.chenxiaosong@linux.de=
v> wrote:
>
> From: ChenXiaoSong <chenxiaosong@kylinos.cn>
>
> Before applying this patchset, the patchset ("smb: improve search speed o=
f SMB2 maperror") must
> be applied first, which introduces `CONFIG_SMB_KUNIT_TESTS` and avoids so=
me conflicts in `fs/smb/client/cifsfs.c`:
> https://chenxiaosong.com/lkml-improve-search-speed-of-smb2-maperror.html =
(Redirect to the LKML link)
>
> When searching for the last element, the comparison counts are shown in t=
he table below:
>
> +--------------------+--------+--------+
> |                    |Before  |After   |
> |                    |Patchset|Patchset|
> +--------------------+--------+--------+
> | ntstatus_to_dos_map|   525  |    9   |
> +--------------------+--------+--------+
> |             nt_errs|   516  |    9   |
> +--------------------+--------+--------+
> |mapping_table_ERRDOS|    39  |    5   |
> +--------------------+--------+--------+
> |mapping_table_ERRSRV|    37  |    5   |
> +--------------------+--------+--------+
>
> ChenXiaoSong (30):
>   smb/client: fix NT_STATUS_NO_DATA_DETECTED value
>   smb/client: fix NT_STATUS_DEVICE_DOOR_OPEN value
>   smb/client: fix NT_STATUS_UNABLE_TO_FREE_VM value
>   smb/server: remove unused nterr.h
>   smb/client: add 4 NT error code definitions
>   smb/client: add parentheses to NT error code definitions containing
>     bitwise OR operator
>   smb/client: introduce DEFINE_CMP_FUNC()
>   smb/client: sort ntstatus_to_dos_map array
>   smb/client: create netmisc_test.c and introduce
>     DEFINE_CHECK_SORT_FUNC()
>   smb/client: introduce KUnit test to check sort result of
>     ntstatus_to_dos_map array
>   smb/client: introduce DEFINE_SEARCH_FUNC()
>   smb/client: use bsearch() to find target in ntstatus_to_dos_map array
>   smb/client: remove useless elements from ntstatus_to_dos_map array
>   smb/client: introduce DEFINE_CHECK_SEARCH_FUNC()
>   smb/client: introduce KUnit test to check search result of
>     ntstatus_to_dos_map array
>   smb/client: sort nt_errs array
>   smb/client: introduce KUnit test to check sort result of nt_errs array
>   smb/client: use bsearch() to find target in nt_errs array
>   smb/client: remove useless elements from nt_errs array
>   smb/client: introduce KUnit test to check search result of nt_errs
>     array
>   smb/client: sort mapping_table_ERRDOS array
>   smb/client: introduce KUnit test to check sort result of
>     mapping_table_ERRDOS array
>   smb/client: use bsearch() to find target in mapping_table_ERRDOS array
>   smb/client: remove useless elements from mapping_table_ERRDOS array
>   smb/client: introduce KUnit test to check search result of
>     mapping_table_ERRDOS array
>   smb/client: sort mapping_table_ERRSRV array
>   smb/client: introduce KUnit test to check sort result of
>     mapping_table_ERRSRV array
>   smb/client: use bsearch() to find target in mapping_table_ERRSRV array
>   smb/client: remove useless elements from mapping_table_ERRSRV array
>   smb/client: introduce KUnit test to check search result of
>     mapping_table_ERRSRV array
>
>  fs/smb/client/cifsfs.c       |    2 +
>  fs/smb/client/cifsproto.h    |    1 +
>  fs/smb/client/netmisc.c      |  155 ++++--
>  fs/smb/client/netmisc_test.c |  114 ++++
>  fs/smb/client/nterr.c        |   12 +-
>  fs/smb/client/nterr.h        | 1017 +++++++++++++++++-----------------
>  fs/smb/server/nterr.h        |  543 ------------------
>  fs/smb/server/smb2misc.c     |    1 -
>  fs/smb/server/smb_common.h   |    1 -
>  9 files changed, 739 insertions(+), 1107 deletions(-)
>  create mode 100644 fs/smb/client/netmisc_test.c
>  delete mode 100644 fs/smb/server/nterr.h
>
> --
> 2.43.0
>


--=20
Thanks,

Steve

