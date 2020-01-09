Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B8113602C
	for <lists+samba-technical@lfdr.de>; Thu,  9 Jan 2020 19:31:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=MCSrDHZHZx6RhMZE2+Je1a/5ofwAYFbx6RT8eoh/lxI=; b=IyvSxMYekod8ewS5oSPFKv0AcP
	NOIJNrkWe762Vm7S7+lSxfDleULYJqUk9sih17M1qGzdZc5aNelDE29u6jk+C3VffbOIjCZwwuscx
	p0DL6/DeEGZhBoA24nM/YPqpxE2Q+oXyyGzLmZyV1uv8xCEucThhb6IDVFORsNzbixlW5ruh30Stg
	n0ajHyhoLADFUfiTZjbd7wcetEjnyHSXHIHVryaU3zWiE8nqnst7J2DjNdb86tR0uT7kIBMsy+AAO
	pOyRGAJIG0N5XYjGhLQS1LS3v9KDvTgdGy2sxOTJJaoGmwG0ZHX8XPOtU1WcZ7yag/2vfoJPxt2hF
	qQGkE1bw==;
Received: from localhost ([::1]:47622 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipcZP-002rBu-DN; Thu, 09 Jan 2020 18:30:11 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:44968) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipcZG-002rBm-7X
 for samba-technical@lists.samba.org; Thu, 09 Jan 2020 18:30:08 +0000
Received: by mail-lf1-x144.google.com with SMTP id v201so5909706lfa.11
 for <samba-technical@lists.samba.org>; Thu, 09 Jan 2020 10:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MCSrDHZHZx6RhMZE2+Je1a/5ofwAYFbx6RT8eoh/lxI=;
 b=UaoVqme8Xcy9V3p6VsXYDT2UaTYoyEsEACUJSYwTGp7xMfuayJmnTtkwEDlTJl3maT
 D9lP7JdZjurYxB1GmaJSiav3tw/0l/m+XO0nUwCINSFqA+iAwEBynR1nKxiy/L2LwqFp
 4E4IIeH8WbZTjslvDWSSv0lLHIyprLUzaSvfg2OJAFPBo+3XEzIpZkP9x3L4eV2E6SPD
 O4lltRwR7g7qQ18d57lj7gyYqgNR7K96pcsW4mnj4cCvRmrduGUn5GG0OWJq1qpRhThJ
 pcCHIQBPhLOA6O1TakSwGqaF+ceyqL3mII+erdmJg+oO1dBemekvMYBhh+yfdK9XI+bP
 skhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MCSrDHZHZx6RhMZE2+Je1a/5ofwAYFbx6RT8eoh/lxI=;
 b=XXpWmvH9EG1VNmpHcuSp7SoHrUs+Zc0fLnd59CGTxqQliNubgHRuxFzEW7+gIzF8+j
 C/lDmQuDVnQhy61n2Z7oA68j09koSWfPan9vR6mXZQRyRP9kGKLvwyKkufM1nRDtxU4o
 fxIvBjEKjQVLynb9MwbmVNXtfsmH1MKTQPUOWEUD8I0ceT/v+f8hN+GZXxp7JvdLf4Qa
 BhCL0gEChwUzvBRxE0FrcAqdoNknw99XGo8PCm2NCxwrxIleDD0aGqHEDppF22lfMTUu
 /QquoFV9Cn5WC0Y54QuUqMuFXqroMApA6hVgsXr4pEQWY1VIwJG7KlnIx/9nsLlZaCnP
 nL5Q==
X-Gm-Message-State: APjAAAWlQiWVi41aqz0XPKbSQpq9oi9fuWe19A2nBaS9vY5Ge4+mE0LA
 /wwizVO/JG9X9qDYVUq2OvxLx0OHUD0tVGf20g==
X-Google-Smtp-Source: APXvYqzI+v3lmB4Xu+Swv/657Qmi/qR+yawJXSfba9wxut1/eoXKumroTaEgLxpbOX+bRcS1iJ9VI59eREOshwDcXTY=
X-Received: by 2002:a19:c148:: with SMTP id r69mr7389791lff.142.1578594601248; 
 Thu, 09 Jan 2020 10:30:01 -0800 (PST)
MIME-Version: 1.0
References: <20200106163119.9083-1-boris.v.protopopov@gmail.com>
 <20200106163119.9083-2-boris.v.protopopov@gmail.com>
 <CAKywueSK-_zzF-K3_ehmLT3yje_hGaQU-1z-G3hYugMv3ZV-eA@mail.gmail.com>
 <CAHhKpQ7PCQXgvXkjTUuPtX2OHVxee9seGyRT=omJXvZLt3=ygg@mail.gmail.com>
In-Reply-To: <CAHhKpQ7PCQXgvXkjTUuPtX2OHVxee9seGyRT=omJXvZLt3=ygg@mail.gmail.com>
Date: Thu, 9 Jan 2020 10:29:50 -0800
Message-ID: <CAKywueSXxYxZLDAXPwsHTyUSHyWV5WmssOwvo7xF-Wgf57XEsg@mail.gmail.com>
Subject: Re: [PATCH] Add support for setting owner and group in ntsd
To: Boris Protopopov <boris.v.protopopov@gmail.com>
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
From: Pavel Shilovsky via samba-technical <samba-technical@lists.samba.org>
Reply-To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: Steve French <sfrench@samba.org>, linux-cifs <linux-cifs@vger.kernel.org>,
 sblbir@amazon.com, samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

=D1=87=D1=82, 9 =D1=8F=D0=BD=D0=B2. 2020 =D0=B3. =D0=B2 08:07, Boris Protop=
opov <boris.v.protopopov@gmail.com>:
>
> Yes, there is a patch that I have recently posted to linux-cifs and
> linux-kernel list (subject line "Add support for setting owner info,
> dos attributes, and create time") that enable setting owner/group in
> ntsd, file native attributes, and file create time.

Thanks for clarifying!

We need to make sure that the appropriate error is returned for old
version of the kernel that don't have the patch.

--
Best regards,
Pavel Shilovsky

