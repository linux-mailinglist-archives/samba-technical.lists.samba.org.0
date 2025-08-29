Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6383B3C17D
	for <lists+samba-technical@lfdr.de>; Fri, 29 Aug 2025 19:05:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3C88U5kzwPM12OywuB+rF2YIxAqomnjTRojoRztls2s=; b=KwppjK+n1LxZD3x3shBDB8ggCf
	Mji4jJx86Mq+jkKXOBgDHb7n+uckY3e4nQHJfgV6Qu5b67JNuR8YiDwhWQJSwIXhK9ALsXEPFhogq
	Mz3Zpjgatt0ocxEnmRioIQW2sCt+dcGXlfB7Hd09SeyTNdm1IkwiVkAZQfK0QB7N7V1BTzX0dkcBk
	K6H75IItOKlp8GVxpCmSagyO71I37ZCAX1YJ167K6IhtYVg5h8wonZfMCUKa+PGavz2awrffmkzmh
	janOhmSHQNBDdBjv+QL6mifq1IvY6Y9UuuRdrmLWs3TAEMtvyE3mv3h+UBZZFRTHdLx9ZrTYbCSbl
	4kot2x7w==;
Received: from ip6-localhost ([::1]:42486 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1us2XV-000mFe-6b; Fri, 29 Aug 2025 17:05:25 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d]:54471) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1us2XM-000mFW-7R
 for samba-technical@lists.samba.org; Fri, 29 Aug 2025 17:05:19 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id
 6a1803df08f44-70bb007a821so28206596d6.0
 for <samba-technical@lists.samba.org>; Fri, 29 Aug 2025 10:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756487114; x=1757091914; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3C88U5kzwPM12OywuB+rF2YIxAqomnjTRojoRztls2s=;
 b=T+A9JXr1buIH5qAxnWISXU0EL3tlKUkyv/mqOc0UNAb7Iw8Dk613bnYEtils1fFUrG
 EDi2r3bbtO8e60sHhhrqR7o/bTcCuatL/tfe9PiwTssUNXvEVVtqyAIsBByhjelWD0Pu
 U3bsxIvzAx+KbGW0wM7i/pX47eBXLIGRWdafLCJjy+WIGCFYMOTTUj9Ze8Uk0CHOq8bO
 RPmFOFRRBx/4qdHGd3s69zgbcUJ08movqTT+eKWG84hR5cyCHlFf5lUzcl/p0lZXKb3K
 IhZ7VePbjdo/voAafo6Md+ZFWVB3l331sUjguobe6la6HmaNSgeC4JCJft4REKVnckXK
 J34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756487114; x=1757091914;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3C88U5kzwPM12OywuB+rF2YIxAqomnjTRojoRztls2s=;
 b=vytOC10nNj3L5u93K8LnEkQohVSZHwvvdhUQSevZxZvQlz9AAdx21MUFkZ3xsQ0JJI
 TzSU0DdXx4LTm3NDp42jHpZ6kz9DhOUGZ7+cgo37BcoBCI5JFPM7ik2GktG2cmPPEeiO
 RbcDbZXfiEzBe6zjE3VYiWNmkR5WVBuOeyghGdrtZdjrwf0c2YC+bfcQfP/v1DwbI80s
 tfPW2SetGnkW0qrO6PAmjM4kmkyMAMwYnOiLfYNdE2RuMqgQL1tYGI6xI26bsfEMaPNy
 0ukMABa0AZlAuYzTrRNpyQOCbsCtkoAHpePpeqm4euPn26fHihjpcYcRVX2QTjuwsuv9
 lQZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSMtjeQCGkC7CRioF0+FNhTbycUk0HplXr8haXET9cuS0ZbwR8lCvTzefRD5iFOvypoJjWCYyLu3i+YYt1lV8=@lists.samba.org
X-Gm-Message-State: AOJu0YzJANf2IpClEPDaXYdUOC8Wp3fL1yl8kPnR9sWn2fS3W9u6KQ00
 3vQG4kBzvrBPbon/RV9b6cQPMbKU3m7ChRunT3I7ZEpYCIHasFBd1o+LIFxe8kljO/znExVAObW
 WFBryKcfBgYcruaDFVLlTxEUaYpYiZRM=
X-Gm-Gg: ASbGncvmnUCuqPffpOpyYjaG1eGkzCt+fkVBYOWkmr7PZZ1PTyhxXVd6R3vRiY60cuk
 vCPiaUuUuN0b2EOczgOU1wR8h1gVL8ZMKHBNdf9AsaUXh/UbR2iEolkKOTBY30lOuX6LWno9/d2
 qxVXGBJT8Udg3uFdNrkEuCUjc9iOimdMu061VnyolL37STeTABySDw+Ej5ESB19t8zrXSVrt/Ol
 M5Ebs2KFvF9cxN+LspupQsnkIvn1VItHX/z2b+WXxX7HbgEeykdb5jFNVfcHrhahW6dkObJZpg1
 7uQJEEFWOK+eqempK2HpVmjlg+eS4IjH
X-Google-Smtp-Source: AGHT+IH5/bPmpJrEbJA1Mefpey8CWdyOIdL4hdYgR5neUNkk8HTJlBB5aQrDpjjh1yjIKxicNi0VvyhHikBUqoxS4sQ=
X-Received: by 2002:a05:6214:5009:b0:70d:fce4:1102 with SMTP id
 6a1803df08f44-70dfce41333mr55912246d6.5.1756487113776; Fri, 29 Aug 2025
 10:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250829005959.2205950-1-wangzhaolong@huaweicloud.com>
In-Reply-To: <20250829005959.2205950-1-wangzhaolong@huaweicloud.com>
Date: Fri, 29 Aug 2025 12:05:02 -0500
X-Gm-Features: Ac12FXyM9kkkTUmEVsTO_O9B9CpR17KHIvOcOxtu30NwSlCW_D36vOjlvcK5_Zg
Message-ID: <CAH2r5ms7biGGTARH=cXPz80HaEcysRQztYgYHLL0vLTaVRsOBw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Fix NULL pointer dereference in
 cifs_debug_dirs_proc_show()
To: Wang Zhaolong <wangzhaolong@huaweicloud.com>
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
Cc: linux-cifs@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 bharathsm@microsoft.com, chengzhihao1@huawei.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Good catch.

Merged into cifs-2.6.git for-next

On Thu, Aug 28, 2025 at 8:08=E2=80=AFPM Wang Zhaolong
<wangzhaolong@huaweicloud.com> wrote:
>
> Reading /proc/fs/cifs/open_dirs may hit a NULL dereference when
> tcon->cfids is NULL.
>
> Add NULL check before accessing cfids to prevent the crash.
>
> Reproduction:
> - Mount CIFS share
> - cat /proc/fs/cifs/open_dirs
>
> Fixes: 844e5c0eb176 ("smb3 client: add way to show directory leases for i=
mproved debugging")
> Signed-off-by: Wang Zhaolong <wangzhaolong@huaweicloud.com>
> ---
>  fs/smb/client/cifs_debug.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/cifs_debug.c b/fs/smb/client/cifs_debug.c
> index beb4f18f05ef..edb2e7f7fc23 100644
> --- a/fs/smb/client/cifs_debug.c
> +++ b/fs/smb/client/cifs_debug.c
> @@ -302,10 +302,12 @@ static int cifs_debug_dirs_proc_show(struct seq_fil=
e *m, void *v)
>                 list_for_each(tmp, &server->smb_ses_list) {
>                         ses =3D list_entry(tmp, struct cifs_ses, smb_ses_=
list);
>                         list_for_each(tmp1, &ses->tcon_list) {
>                                 tcon =3D list_entry(tmp1, struct cifs_tco=
n, tcon_list);
>                                 cfids =3D tcon->cfids;
> +                               if (!cfids)
> +                                       continue;
>                                 spin_lock(&cfids->cfid_list_lock); /* che=
ck lock ordering */
>                                 seq_printf(m, "Num entries: %d\n", cfids-=
>num_entries);
>                                 list_for_each_entry(cfid, &cfids->entries=
, entry) {
>                                         seq_printf(m, "0x%x 0x%llx 0x%llx=
     %s",
>                                                 tcon->tid,
> @@ -317,12 +319,10 @@ static int cifs_debug_dirs_proc_show(struct seq_fil=
e *m, void *v)
>                                         if (cfid->dirents.is_valid)
>                                                 seq_printf(m, ", valid di=
rents");
>                                         seq_printf(m, "\n");
>                                 }
>                                 spin_unlock(&cfids->cfid_list_lock);
> -
> -
>                         }
>                 }
>         }
>         spin_unlock(&cifs_tcp_ses_lock);
>         seq_putc(m, '\n');
> --
> 2.39.2
>
>


--=20
Thanks,

Steve

