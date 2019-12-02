Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A075110F304
	for <lists+samba-technical@lfdr.de>; Mon,  2 Dec 2019 23:58:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7OqmQQJODK9vo7ge/B5mit6aPLYvUZlqzcHChoc1YCQ=; b=GW5OKtBxn7cw/+wKU6ki0NOfOz
	dmUNoNRrBIO4hf6Xh/Vk8lKyqz+75OyHL86E3XuwnVMwh6s6OK/1cwGDuUa8dG4vPX/VzrJpncAQH
	cazObKablFlRkx0hunJL8dCmv3w6gc86ce3on4cOUBEBzSAUkrlpggVs/KhO9Cmz7+PurTF33NXOe
	cK4JI5QCf6NsXTy244xE9tUnRD+3lWvoXOdMpRWIJYV0NfpS7T2Nz3SA9LgN63aB0t5ocOWhCy5dj
	UZ103EcQdSrZNaqfUIAJxxNHbrjwI/2xhtBf9+QvJCHkiYCzTp7HbPATQ/WsWtvJIZRLDYXWCqV3i
	PDFWROzw==;
Received: from localhost ([::1]:61070 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ibudI-005hwD-TL; Mon, 02 Dec 2019 22:57:33 +0000
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:43757) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ibudE-005hw6-Of
 for samba-technical@lists.samba.org; Mon, 02 Dec 2019 22:57:30 +0000
Received: by mail-io1-xd43.google.com with SMTP id s2so1351218iog.10
 for <samba-technical@lists.samba.org>; Mon, 02 Dec 2019 14:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7OqmQQJODK9vo7ge/B5mit6aPLYvUZlqzcHChoc1YCQ=;
 b=F22W3AgfuOPDFHPUrzCdhSGKZJ5xlcnM9mGSYTNvFr6FpKl9wy/vJ0TDsYGmK/Lmi0
 k+7DaOUXEByM/pAYnnZjwVG+jAJXMkaoQZW/FIKAXTyKHrWNdo9PCeWqsHdtLS9jzZMl
 FFcznrw13nyZ1FTCsnAQMpH9kEdemBNM5JSJkOoiQZRD1NRhZVke2mdAzRMYJG8ERrQn
 vN/gyPBpQaUzOCbziR/WY250xSzZn5sBeIBRpSnc7bFX74UJzO4DZQPqdXbEe4YAcWiC
 /vhIyZzZct+N8pgTpmOg1DLcva9ycL6G0BfkqnSMUwqYs+zSA+udV+WorBeQwdxSYcJZ
 uNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7OqmQQJODK9vo7ge/B5mit6aPLYvUZlqzcHChoc1YCQ=;
 b=gFszESjaz5auXSYWNBx1xPXOgnWHYcOoA4G72CAlBDjgdgaC82Kf/JhunxikNrrscn
 0FCEsMLtIiUwsojvp8u9Lbtd2n6Z1cttnzLpCR0ku/EjTvjeE09jH14M+7R8hzWi79IW
 bY3C/D2+QeYzuNYvbqb+Qra3/vMyYhlZ90MM3YkB2KMpUUtoh7uWJbGuIhwLzxcOgrsy
 Ng/WdKGeu33VmXY7Nj9oUaZDOxxNrfq76O1+4lGyGrrEwTrrZsSi/STIM31+3T8tOmdr
 z8rW80zP6X/aok7Ms2icq3eOKb2JbQEalQ+kZyApzF4u59uLWpeJN3Y35FmgtIiXs8iO
 LdEg==
X-Gm-Message-State: APjAAAUpAXO2xcNzT4Mh7M9nm/XlREVaWvj7QHDP+qT6IS4iv3WJSWHv
 fXOzivmQR1uuxvoIe5YRY46POpUzi/s9snFHfng=
X-Google-Smtp-Source: APXvYqzqgWdV8UxJScltcaQcOuDlIwZa5df7npulO3GcZdYl61HsqySvcNsIK04eAK1TVZwGNGoelGvqxFtQSH+5kGk=
X-Received: by 2002:a6b:8d11:: with SMTP id p17mr1252191iod.3.1575327446607;
 Mon, 02 Dec 2019 14:57:26 -0800 (PST)
MIME-Version: 1.0
References: <20191202185942.81854-1-colin.king@canonical.com>
In-Reply-To: <20191202185942.81854-1-colin.king@canonical.com>
Date: Mon, 2 Dec 2019 16:57:15 -0600
Message-ID: <CAH2r5ms+DVGP+Wgx+cTe65sBCFskrXBNxNe1gMDr+sEQ1DbqAA@mail.gmail.com>
Subject: Re: [PATCH] cifs: remove redundant assignment to pointer pneg_ctxt
To: Colin King <colin.king@canonical.com>
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
Cc: Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Mon, Dec 2, 2019 at 1:00 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The pointer pneg_ctxt is being initialized with a value that is never
> read and it is being updated later with a new value.  The assignment
> is redundant and can be removed.
>
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  fs/cifs/smb2pdu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/cifs/smb2pdu.c b/fs/cifs/smb2pdu.c
> index ed77f94dbf1d..be0de8a63e57 100644
> --- a/fs/cifs/smb2pdu.c
> +++ b/fs/cifs/smb2pdu.c
> @@ -554,7 +554,7 @@ static void
>  assemble_neg_contexts(struct smb2_negotiate_req *req,
>                       struct TCP_Server_Info *server, unsigned int *total_len)
>  {
> -       char *pneg_ctxt = (char *)req;
> +       char *pneg_ctxt;
>         unsigned int ctxt_len;
>
>         if (*total_len > 200) {
> --
> 2.24.0
>


-- 
Thanks,

Steve

