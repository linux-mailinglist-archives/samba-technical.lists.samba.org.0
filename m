Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9C6BFF4B
	for <lists+samba-technical@lfdr.de>; Fri, 27 Sep 2019 08:41:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=YcAfvLPy/pxT4ppeidkfafwRUndj54+MRWsrMKkiHAI=; b=wTHWM7f6MBwI2xdvm9xhRo/apk
	IWrRm4wpYlFvZBGZqFrrZtWxdlGJi4wbYGUAFE7CxZ6vbt6Ru+6/PgOsyrc9gA+0phhLy2zHRT2Fq
	vIExIyXGYO0ekcpM4911YhGKiGgh1pcZgOL4rYsuOvHjDElHNkg1gZFyq/RXbh27yJ5xksiKcUvXr
	BA4l02x0S8k0rxH+s9gcneX6twc9Xdn07BUyBAB76aG1vnjIq2zIsrM/7LhYDM3CQR0R1+HvMoUOs
	ACr9PTxzv9Ss3MHGaAH8yLrRtIgBq5ASn769nO2nzMqI+BllTlfAzz7WVIUZL6xdd7kx9Hd7jOFP6
	aAC3LoZg==;
Received: from localhost ([::1]:34928 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iDjv6-0094LZ-DO; Fri, 27 Sep 2019 06:40:00 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a]:42649) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iDjuw-0094LQ-If
 for samba-technical@lists.samba.org; Fri, 27 Sep 2019 06:39:53 +0000
Received: by mail-io1-xd2a.google.com with SMTP id n197so13414688iod.9
 for <samba-technical@lists.samba.org>; Thu, 26 Sep 2019 23:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=YcAfvLPy/pxT4ppeidkfafwRUndj54+MRWsrMKkiHAI=;
 b=Vr8iCUUnlwhWtQOljuexwHzRvzj7QWCOOd91gmkjdqVtaCHr/x8eTnKuL8XfQ+lPzK
 C2c7y4nOGS5B1nRQlKj/iKlKI45ik80ZFP9/JckxPfrzGTCH7YKy/9UVe8CKNzFhNTwN
 sx0xQxIf9gE+YrBGRnHUNp+Sk/zLALe9VCP567OiLFkZyd436fljClHJNkx5pD1E+AxV
 v53gHouSiz0kqGoFis/KIqKr+Dx6gzG/NCbnRo4j6SfGuoCxcVT1nJKwMVewWKkd4t2+
 cgPh6FeQx+wXc22Y1cFym8Q7nwmw8qqM4UREhjWuvncaTQSOAzIjykhGOj8b8MC5Lhtq
 BIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=YcAfvLPy/pxT4ppeidkfafwRUndj54+MRWsrMKkiHAI=;
 b=RYo+j1ZaMO02I2czMyzwg36y+Q6/Xgya6+oOsH8y4sLcDT8/MRuKhSgkC3ucqxL5+5
 XPyBwRAFc0acSQtznYgxJ+aBNWOts6f/ia1Hiyp0URWbbuJfD4BYkf0I396U734/ZN7b
 B39AUrCruaLlUZSBU53n1zZ7T0Pb200jZpQHufuojHH+dkt5lvxpbs8lVV13yt6US8B6
 +jCg30fVI5S0jF7MvftyWROfox2azAKayn+u+VySv5MuIiDhwTVVfub1nCDRQlzbr+nU
 jNMC/AtUV3GnZPJsRPLQ9NcR7PD00dG+j+xArJcXG3Ym2HqDcKaGvlPb3rl5SieXPRDV
 OPUA==
X-Gm-Message-State: APjAAAUDV0+Q2SPsS27HcDHGdGhvmLEfoscR8r5KC3JVi9NlLBEFXqxi
 OlumnPl7RalWqIfulBZC5YPkZ1FLtN7XxFv8W34=
X-Google-Smtp-Source: APXvYqwSwsmHDb02MjyWRngpxmOTIbX3Yk914OYbmkp8U7NE767Y87BptXWCKJX4MRMdibF6msnHNvsAu9fRj7zzJ6s=
X-Received: by 2002:a92:d641:: with SMTP id x1mr3033237ilp.272.1569566388391; 
 Thu, 26 Sep 2019 23:39:48 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 27 Sep 2019 01:39:37 -0500
Message-ID: <CAH2r5mueOCtAsWjOc3n2OgnygSMmj22uycsvfNKPAiqhx68xsg@mail.gmail.com>
Subject: Getting the SID of the user out of the PAC ...
To: ronnie sahlberg <ronniesahlberg@gmail.com>,
 Pavel Shilovsky <piastryyy@gmail.com>, 
 =?UTF-8?Q?Aur=C3=A9lien_Aptel?= <aaptel@suse.com>, 
 samba-technical <samba-technical@lists.samba.org>,
 CIFS <linux-cifs@vger.kernel.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Is there a way to get the SID of the user out of the MS-PAC through
Samba utils (or winbind)?

This would help cifs if when we upcall as we do today to get the
kerberos ticket, we were also given the user's SID not just the ticket
to use to send to the server during session setup.



-- 
Thanks,

Steve

