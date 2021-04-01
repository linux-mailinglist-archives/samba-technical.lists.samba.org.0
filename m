Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B880350E83
	for <lists+samba-technical@lfdr.de>; Thu,  1 Apr 2021 07:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=r3yXI37DsWPTrxK/PppT+4nfYQwdcQsdqAES8z+Kcrg=; b=11p+Cnw6PvYATiPmnifzimQPO+
	FDjXe32Knrd7MTkY6hgMaufAF/QewtWLZ5ZMTjESDj8yRbucCo0YBvZ+dVfdEKJKffqQAZLMbBQy/
	3L5ev6k0m2+SM5QOBnZEKYHL7URy3v7aqG1C1jlgV6gjVDpohFoUfhF+RBsWQqtNHk1GkCiRFsVGB
	CzJBpTvqsj5g3ygkKZe4qRz2yDEv65SzZ/jdRunK1ecQap+UdIIUBIt7wypPp5lcYVQ7cBt9G7b6V
	B/cTMQpmNVb80OPTQe4u+Li1lB6JRb8g8sp0TUoK2qBtTE5sVAdqbrFFVkVwvBG5DsXMLvDY2bE1M
	cH5GUzBA==;
Received: from ip6-localhost ([::1]:48702 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lRq5C-009QYC-Lf; Thu, 01 Apr 2021 05:41:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:40669) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lRq56-009QY5-Ir
 for samba-technical@lists.samba.org; Thu, 01 Apr 2021 05:41:27 +0000
Received: by mail-lf1-x132.google.com with SMTP id d13so1033661lfg.7
 for <samba-technical@lists.samba.org>; Wed, 31 Mar 2021 22:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3yXI37DsWPTrxK/PppT+4nfYQwdcQsdqAES8z+Kcrg=;
 b=eBy/4Fxw5xhFVpnwZk8vYnw/fn45K3XU30jCIrt1T13N+74ApewDegPiKMbAxf23Nf
 6SqvhRHYCHfmEdIWIsneHsBTCCOqORnV8aQMlIgCaSMcSNhryneGo/UEaOtsJVAkoABM
 Ze4RVky7sbg2jFdDplVsOQlGrHnNKVUiitC6c0XG3A88m1fuWkFFxNiWjCxROBvRVD2C
 45m8esrP2bAPmg0b3z5QzFd4J+ia5bO6L3MjEhd4uAUsNElRQ3QEQRrd7etFIjyGFwu6
 4R1mSFJ2Geg8p943OagA8sRm77kasoO/JOBHEA8NCfcLy1QHB+cxpFcb4+8ZE8ga/r3S
 6jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3yXI37DsWPTrxK/PppT+4nfYQwdcQsdqAES8z+Kcrg=;
 b=bSeJwyT9IracNnYlo7nUFnXwpB28IbKcVEnX054jYjLzpSRzadLGP3kK3vQVLiOhGj
 PedTArxIt3yzEnB7dHOGJECakZCWU9pWABYuAOLOLZB4vFsiSY4cUlaX6Z5KUIu332v2
 NxgYPIV3qp4VpLFXBn1wp8C3syzbGmkJVOqsu5yMrX99BblB0EJ6XQobjnr9VRYpCWji
 KVMsSJpb05erRXUEFu25H1apbr/4eyx5R+sawZ/iHwYl3FbYvShJ1NZIRm/FZaO0cv3y
 WKdPz83o1U6nzq0Co/pxQUWXkPCcoUxgSzz3tRyyROm5tIm9+clgILcS1+ePPVJgOspU
 SJyA==
X-Gm-Message-State: AOAM533uY8yhFWD3kGz/db8vj6KE/Nq/sUAika1EHbohVBorrBAXUUAg
 o8S+UvomatGl21/djeg/C1VC+PgwvI7k5fHQ/Ac=
X-Google-Smtp-Source: ABdhPJyuyL1kYspGud6WwJPZhdO+olUN9ENdBQsMNmqx8QsJMwa08PORRKQgPISUtBMfGqs1EyO33PYfdmZaCz5ZmLg=
X-Received: by 2002:a05:6512:210b:: with SMTP id
 q11mr4293261lfr.133.1617255683169; 
 Wed, 31 Mar 2021 22:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210326195229.114110-1-lsahlber@redhat.com>
In-Reply-To: <20210326195229.114110-1-lsahlber@redhat.com>
Date: Thu, 1 Apr 2021 00:41:11 -0500
Message-ID: <CAH2r5mv6qb996ZEvDaF_Y4sis3NBQeTyt1sNq5RUJ7sW3j_68Q@mail.gmail.com>
Subject: Re: [PATCH] cifs: add support for FALLOC_FL_COLLAPSE_RANGE
To: Ronnie Sahlberg <lsahlber@redhat.com>
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
Cc: linux-cifs <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Running xfstests on this patch (along with the previous INSERT_RANGE
patch) fixes at least six xfstests which were skipped before:

# ./check -cifs generic/072 generic/145 generic/147 generic/153
generic/351 generic/458
FSTYP         -- cifs
PLATFORM      -- Linux/x86_64 smfrench-Virtual-Machine
5.12.0-051200rc4-generic #202103212230 SMP Sun Mar 21 22:33:27 UTC
2021

generic/072 7s ...  6s
generic/145 0s ...  1s
generic/147 1s ...  0s
generic/153 0s ...  1s
generic/351 5s ...  3s
generic/458 1s ...  1s
Ran: generic/072 generic/145 generic/147 generic/153 generic/351 generic/458
Passed all 6 tests

Promising ... there are additional fallocate related tests that still
fail or are skipped, but good progress ...


On Fri, Mar 26, 2021 at 2:52 PM Ronnie Sahlberg <lsahlber@redhat.com> wrote:
>
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Ronnie Sahlberg <lsahlber@redhat.com>
> ---
>  fs/cifs/smb2ops.c | 40 ++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/fs/cifs/smb2ops.c b/fs/cifs/smb2ops.c
> index 9bae7e8deb09..3bb18944aaa4 100644
> --- a/fs/cifs/smb2ops.c
> +++ b/fs/cifs/smb2ops.c
> @@ -3640,6 +3640,44 @@ static long smb3_simple_falloc(struct file *file, struct cifs_tcon *tcon,
>         return rc;
>  }
>
> +static long smb3_collapse_range(struct file *file, struct cifs_tcon *tcon,
> +                           loff_t off, loff_t len)
> +{
> +       int rc;
> +       unsigned int xid;
> +       struct cifsFileInfo *cfile = file->private_data;
> +       __le64 eof;
> +
> +       xid = get_xid();
> +
> +       if (off + len < off) {
> +               rc = -EFBIG;
> +               goto out;
> +       }
> +
> +       if (off >= i_size_read(file->f_inode) ||
> +           off + len >= i_size_read(file->f_inode)) {
> +               rc = -EINVAL;
> +               goto out;
> +       }
> +
> +       rc = smb2_copychunk_range(xid, cfile, cfile, off + len,
> +                                 i_size_read(file->f_inode) - off - len, off);
> +       if (rc < 0)
> +               goto out;
> +
> +       eof = i_size_read(file->f_inode) - len;
> +       rc = SMB2_set_eof(xid, tcon, cfile->fid.persistent_fid,
> +                         cfile->fid.volatile_fid, cfile->pid, &eof);
> +       if (rc < 0)
> +               goto out;
> +
> +       rc = 0;
> + out:
> +       free_xid(xid);
> +       return rc;
> +}
> +
>  static loff_t smb3_llseek(struct file *file, struct cifs_tcon *tcon, loff_t offset, int whence)
>  {
>         struct cifsFileInfo *wrcfile, *cfile = file->private_data;
> @@ -3811,6 +3849,8 @@ static long smb3_fallocate(struct file *file, struct cifs_tcon *tcon, int mode,
>                 return smb3_zero_range(file, tcon, off, len, false);
>         } else if (mode == FALLOC_FL_KEEP_SIZE)
>                 return smb3_simple_falloc(file, tcon, off, len, true);
> +       else if (mode == FALLOC_FL_COLLAPSE_RANGE)
> +               return smb3_collapse_range(file, tcon, off, len);
>         else if (mode == 0)
>                 return smb3_simple_falloc(file, tcon, off, len, false);
>
> --
> 2.29.2
>


--
Thanks,

Steve

