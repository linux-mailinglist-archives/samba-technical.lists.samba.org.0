Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1C2F095F
	for <lists+samba-technical@lfdr.de>; Tue,  5 Nov 2019 23:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=U5wxPbwQtKBHc/N9ZJcuYcLTQ68b1CJSxGQDhLrTlZk=; b=L5QX5UB0QVkTy9ko1eemxyuhlZ
	dJet+/AmrxjnDNdkcV/m2V8B1DH5gXkEvFl6EokphtCI3jk1NxMme7ftn/mjouofKyPmFOHuWHz4U
	LqTwkjrF7kh6ngrkvo4lO49DnHY3WTQnFO/nSOUuunY2kkg5fbKrt8sC7Oixs5XUGPSzMklOeZM//
	wj6vjOY2NO5vEB+PlXlmgxmdo9SvrxZX+TBjFc8xcP8x9ZK2Gu7QcCLxYzH0DT+GwCOAJY48hl9yS
	qUpJhMb5HpQgoNm/RgnVKVRXVYviDXoCeYBURh+UTNCeT9QiznLsfZ74b3bjGFuItqxMCNiCc+fUX
	pDD0ng5A==;
Received: from localhost ([::1]:38992 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iS7I8-006rhj-O5; Tue, 05 Nov 2019 22:27:12 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144]:33299) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iS7I4-006rh1-Jz
 for samba-technical@lists.samba.org; Tue, 05 Nov 2019 22:27:10 +0000
Received: by mail-il1-x144.google.com with SMTP id m5so10681351ilq.0
 for <samba-technical@lists.samba.org>; Tue, 05 Nov 2019 14:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U5wxPbwQtKBHc/N9ZJcuYcLTQ68b1CJSxGQDhLrTlZk=;
 b=lRV9knZqxPJQFL4Ti+/r2J+lfX5hyCNcm3ToQnFf2BqgLtYPNLjaNPMZ6CDF1qZan0
 +rU5CC+rsbVnaex+nnzCwz4k87pq9EYrRadMnhIMon/at2fQYkkoSeHARAYhG1/1oKR7
 LzXbRezlkUVvInWpcuhOCBo4tYpG1oERLBNPCaSIucbSOa7YR7ozvFHvxa9MFNDw1eT8
 Gt/bo0edmR2outPXZfxqHlI5DQACH1g36tE9Lg51qrxVj3Z2gB5Ro9sOwLbt1bpudFQN
 wFMRYUM9xg1ig4hCJSeu5y7ogR5Avd+zvXNezzxiCNLQqAj7UfTF7LZh2DS7BAH2gdHj
 pY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U5wxPbwQtKBHc/N9ZJcuYcLTQ68b1CJSxGQDhLrTlZk=;
 b=mEcLrQGor4YpqE+8ni3lDu1s7f9AKiRwnzf+GCv4/a9HC/OZ1IK/ijjeOAPh1MeWUW
 IV1FNn+D+WLfeZPAaA7Mcboq/AdeP8yGRr01o6su7r9OLWWRR/1bRQn7WgN3EKVriXaJ
 czSFtcHozNckUYq0a/tE9jco77Flne88pL2BtQZHqt4bWkWG5zJGTMfx0n8fcvUQ52PQ
 fIz7oMJOo3jprMd7Akmax9jdcrM/ipD3X09uofDYCU4PV/6T3GPAoz6JYZRRnYO1aMa7
 e85T5OSWGMZDPgsblwVIgt//m8yQ1xthd8kP2ErPcuFEDQHHpv8CD6jM27nP+RroMwdA
 lJuQ==
X-Gm-Message-State: APjAAAWG3nQxsC7PpuR+gFGg4GZrgj2VrsYOE2o6LxbYB68RBaown2zX
 pCYMtj3E5u8udAUdHDSFt+nGy1uviP8sTW/oyg0=
X-Google-Smtp-Source: APXvYqzkhGY3lG38QqON8vahg2p/76hRxxnZPDZI/F/hixTAIJPZ3liDt4dCT0+DDf01yPjFZ8wktNFYnfxxlN1GIBc=
X-Received: by 2002:a92:8b4e:: with SMTP id i75mr4984503ild.5.1572992826228;
 Tue, 05 Nov 2019 14:27:06 -0800 (PST)
MIME-Version: 1.0
References: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
In-Reply-To: <b797b2fc-1a33-7311-70d7-dd258d721a03@web.de>
Date: Tue, 5 Nov 2019 16:26:55 -0600
Message-ID: <CAH2r5mvWXtSdKb3RcSR_Z6LwsGhDmR0wBeKekwkS-VG4YnFNpQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] CIFS: Adjustments for smb2_ioctl_query_info()
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Aurelien Aptel <aaptel@suse.com>,
 Ronnie Sahlberg <lsahlber@redhat.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

merged into cifs-2.6.git for-next

On Tue, Nov 5, 2019 at 3:38 PM Markus Elfring <Markus.Elfring@web.de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 5 Nov 2019 22:32:23 +0100
>
> Two update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>   Use memdup_user() rather than duplicating its implementation
>   Use common error handling code in smb2_ioctl_query_info()
>
>  fs/cifs/smb2ops.c | 58 ++++++++++++++++++++++-------------------------
>  1 file changed, 27 insertions(+), 31 deletions(-)
>
> --
> 2.24.0
>


-- 
Thanks,

Steve

