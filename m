Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id D13133A5E12
	for <lists+samba-technical@lfdr.de>; Mon, 14 Jun 2021 10:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=cPi2mAWUH4dBUwQ0+42yleMIrkRQY6tvhTL+Duv5WQ4=; b=IOYl0Hx47Y0rdmoo2Nos3stpDo
	zAuT3kvwSvTXHJTB7uCGzt/nz19+N0y+JNcEYeUDqCMo1ekaKz8OmjwC7lDuydO3Aoon63miDQdiu
	XUkUZuMfevJmpWNwsLKTZetF57IHp+7cjvwpvRvX9jSfR0W5gT5sJjlInP82MlAAEpJv3WRF7VLGG
	L19yaBSucqfF2eH7jMaMHMkKhtJccmP7h4iy6lY4qmpog+g2X42vkRNf9vK/oCy5O1TlIQb7zVDIw
	8MM0cfbB45fUn3YDWOKXNtsBC7Go92l+9xWtYMYbRrLFnH1VHQfxw/OWS+SWsBgTX+Bizt/n8NJbv
	grInZv1w==;
Received: from ip6-localhost ([::1]:34360 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lshbU-005Sjo-1c; Mon, 14 Jun 2021 08:05:52 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48450) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lshbO-005Sjf-AG
 for samba-technical@lists.samba.org; Mon, 14 Jun 2021 08:05:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=cPi2mAWUH4dBUwQ0+42yleMIrkRQY6tvhTL+Duv5WQ4=; b=kEluxKA++BjZLGrqxL9cCci5/C
 /vreC2gjHVWd5eNl7faHbcYTNTT2pmK442qTrNXOJsPY1gZtPcd9X81hW27yEEJuaPD2sYN78TUFu
 g+ijdx9HCiF++xVbVVQb7ioZc88pNmlA5Tb5JaTgrCoOW6jLXQWwG4UtWtadnr2PUr7SnDp18ef7q
 JM0L3XwAtXB+O1HHEzvAdazIqchzFiJSzm8OkJBYirmhvPpOHzzzCq+oxe2uakSQomHXwRHZHc2Ic
 jtNhz2bdy7h7WOEw66sCu19mFNLdhEXJC9MP5aVkeQWps8dguYNyVU5xn7iXjeQBhMuDee3OMa9jS
 Y1pHrkjFCJZEj0ah9tUe0g14WFqH/Db7pJqCo0aBJwcNG9j7Tj8FZMUxb2oLymh5xl65rSgdbkSJf
 lBZYwzlHt0DrsUEujLkoS+m7Gz0WrZNAOfZxeh/cPJDuRoJ/9nVWV93taoOwD7SjjA+dTeb+2Rza9
 ETFJNTXr1/wNzhcqzXPsKqU5;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lshbN-0003V7-4x; Mon, 14 Jun 2021 08:05:45 +0000
To: <bigras.bruno@gmail.com>
References: <CAJwt-Jns5=XneYgidODs+SjJmWvoq=BhwbvRA0Z4SDKLgdZs3Q@mail.gmail.com>
 <CAH2r5mvv8dn+u9JVMJo0dvQ_Nk2esO-uDY4J=equS6AcMgSbOg@mail.gmail.com>
In-Reply-To: <CAH2r5mvv8dn+u9JVMJo0dvQ_Nk2esO-uDY4J=equS6AcMgSbOg@mail.gmail.com>
Subject: RE: Is it possible to mount a cifs share with kerberos using the
 machine account (with active directory)
Date: Mon, 14 Jun 2021 10:05:44 +0200
Message-ID: <BFA44EA808EE4625B335F8D440B1559C@rotterdam.bazuin.nl>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Office Outlook 11
Thread-Index: AddfHYpRc1i/P79LS9auXpWRYUYTXQB08O9w
X-MimeOLE: Produced By Microsoft MimeOLE
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
From: "L. van Belle via samba-technical" <samba-technical@lists.samba.org>
Reply-To: belle@samba.org
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Yes, that works fine here at least for years for me. 

Make sure you have an A (AAAA) and PTR record in the DNS. 
Make sure you use /etc/krb5.keytab ( as in, i have not tested it on a AD-DC,
only members ) 

Add cifs/your.server.fqdn to the keytab file 
You can use : net ads keytab add_update_ads cifs/$(hostname -f)
This adds the UPS/SPN to the keytab file and updates it in the AD. 


( dont forget to install: keyutils ) 
And as of this point you can pick almost any automouting setup. 

Personaly i use systemd and automounting, verything is set in systemd its
service files. 
Per example what i use. 

Filename : srv-samba-users.mount << this name must match the path to the
users folder. 

[Unit]
Description=UsersHomes (/srv/samba/users) 
Requires=systemd-networkd.service
After=network-online.target
Wants=network-online.target

[Mount]
What=//server.fqdn/share
Where=/srv/samba/users
Options=(no options, try without first, default are often fine.)
# not working, play with below one.
#Options=vers=2.1,iocharset=utf8,rw,x-systemd.automount
Type=cifs
TimeoutSec=30

[Install]
WantedBy=multi-user.target

##
Refresh systemd:  systemctl daemon-reload

Enable it : systemctl enable srv-samba-users.mount
Test it : systemctl start srv-samba-users.mount
Mount should be done. 
Umount. : systemctl stop srv-samba-users.mount

Add automounter.
# /etc/systemd/system/home-users.automount
[Unit]
Description=Automount Home-users

[Automount]
Where=/srv/samba/users

[Install]
WantedBy=multi-user.target

Refresh systemd:  systemctl daemon-reload

systemctl enable srv-samba-users.automount
systemctl start srv-samba-users.automount



Reboot and test. 

Greetz, 

Louis


> -----Oorspronkelijk bericht-----
> Van: samba-technical 
> [mailto:samba-technical-bounces@lists.samba.org] Namens Steve 
> French via samba-technical
> Verzonden: zaterdag 12 juni 2021 1:57
> Aan: samba-technical
> Onderwerp: Fwd: Is it possible to mount a cifs share with 
> kerberos using the machine account (with active directory)
> 
> ---------- Forwarded message ---------
> From: Bruno Bigras <bigras.bruno@gmail.com>
> Date: Fri, Jun 11, 2021 at 6:51 PM
> Subject: Is it possible to mount a cifs share with kerberos using the
> machine account (with active directory)
> To: <linux-cifs@vger.kernel.org>
> 
> 
> When a Linux machine joins an Active Directory's domain, a computer
> account is created.
> 
> A network share can be configured to give rights to the 
> computer account.
> 
> Can I use that account to mount the cifs share with the computer
> account (with the keytab file)?
> 
> Almost every example on the internet is about using a user account or
> using multiuser (which also uses a user account).
> 
> Thanks,
> 
> Bruno
> 
> 
> -- 
> Thanks,
> 
> Steve
> 
> 


