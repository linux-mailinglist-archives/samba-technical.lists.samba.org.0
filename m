Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A29812AF750
	for <lists+samba-technical@lfdr.de>; Wed, 11 Nov 2020 18:23:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=H3Mgsj+pbbuJaLn2HD8WSErJyMG+HfIE5Nv0xsUgUBY=; b=UdK0VUt14lYnA5Tb/FJrQfQPM8
	Fb9GtpAba9yllMExU+F8ifWjhyLgsA1y8e68bBu1pzP6/OZAhRN12rLIiuvKspsxm0sj3k1jUFmc4
	Pm4mm8cLjvlBlhC6iK/Df9LI5RLANDT2QXpj7fYhRQMGMM2AIg9A7KyHAzmTDze0DkPL+oYGI+ofp
	NgaxfYzLgEriHKDTe0dc73NlXMVWbJWtcrJ38wU9TVjRCiflovZ62toH/x+KIVAs8kbW3vynMj058
	cPV1WEdWr6iFTtMJV8yHgzLeibn4qBSlGNPMILmd2W2DVpKCjC1t7Q1inHWymteRf94zhA+54l77a
	GWGgZRYg==;
Received: from ip6-localhost ([::1]:28410 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kctom-000yAZ-AP; Wed, 11 Nov 2020 17:22:00 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:21772) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kctoh-000yAS-12
 for samba-technical@lists.samba.org; Wed, 11 Nov 2020 17:21:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=H3Mgsj+pbbuJaLn2HD8WSErJyMG+HfIE5Nv0xsUgUBY=; b=Z8FAwqdqIOjw84upRFLeS4eIn/
 qZH/TMKXrK6f7OTdPRfQYrdmhRuWFsJMAOkKhwf4GRRGD3pKQsziDHCUWBE/YeseTCZciB+Y330Oh
 1q1ExsUkCCXBX4296BERiLcLLHsvwYBrQ9OxuV/YCy8pwBHypm1PTD9vpkkHiqD7WN1bbNHelduuT
 ChjGWtDcjKdMIPWDZ7w7+1iPk5IoZVHw4w4aqq932EatGXp8MzVa+9FgSRnemvdJOUQmSIYp77OIE
 e0BRxNQNhOW87nzxd79ewOZ9Ogf3E9m+glrVI7CKrrIjOL9j+2nxwkY9n6wTSFGRc54+4XaIRKBcR
 aNaliuHdRcydimPoAC314G/qOsFojVdY37vJuHKC0qsilOPL4zPHyc2QCw2DVhbtMg6KawRyN4mky
 rsG+oVDuDYkiWk9DtILkWoEy/SgSHRCHCHvSFFS1udGuXQ67y2IcdugzsE4VoeUN9bGwl6yHa8rf1
 /9V64HvjftonU627XsP8dSjW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kctod-0003oK-2R; Wed, 11 Nov 2020 17:21:51 +0000
Message-ID: <306c76b907c8ec78738a86629948f9d33fa555f5.camel@samba.org>
Subject: Re: Eaten by autobuild?
To: SATOH Fumiyasu <fumiyas@osstech.co.jp>, Upstream Samba Technical
 Mailing list <samba-technical@lists.samba.org>
Date: Thu, 12 Nov 2020 06:21:45 +1300
In-Reply-To: <874klw3v4i.wl-fumiyas@osstech.co.jp>
References: <b70db8da503720b24dbadcba32d95556c108d01a.camel@samba.org>
 <87pn4loc5e.wl-fumiyas@osstech.co.jp> <874klw3v4i.wl-fumiyas@osstech.co.jp>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks for the suggestion!

Sorry I was distracted all day with some other patches, and didn't get
back to you.  I really appriciate your work here, it will avoid much
frustration!

Can you add your Signed-off-by to the patch so I can include it in
Samba?

https://wiki.samba.org/index.php/Contribute#Samba_Copyright_and_Community_Policies

Thanks!

Andrew Bartlett

On Wed, 2020-11-11 at 22:01 +0900, SATOH Fumiyasu via samba-technical
wrote:
> On Tue, 10 Nov 2020 17:21:17 +0900,
> samba-technical@lists.samba.org wrote:
> > How about the following patches?
> 
> Demo:
> 
> ```
> $ cat t.py
> #!/usr/bin/env python3
> 
> from email.mime.text import MIMEText
> 
> text = 'Blah-Blah' * 10
> msg = MIMEText(text, 'plain', 'UTF-8')
> print(msg)
> msg = MIMEText(text, 'plain')
> print(msg)
> $ python3 t.py
> MIME-Version: 1.0
> Content-Type: text/plain; charset="utf-8"
> Content-Transfer-Encoding: base64
> 
> QmxhaC1CbGFoQmxhaC1CbGFoQmxhaC1CbGFoQmxhaC1CbGFoQmxhaC1CbGFoQmxhaC1Cb
> GFoQmxh
> aC1CbGFoQmxhaC1CbGFoQmxhaC1CbGFoQmxhaC1CbGFo
> 
> Content-Type: text/plain; charset="us-ascii"
> MIME-Version: 1.0
> Content-Transfer-Encoding: 7bit
> 
> Blah-BlahBlah-BlahBlah-BlahBlah-BlahBlah-BlahBlah-BlahBlah-BlahBlah-
> BlahBlah-BlahBlah-Blah
> ```
> 
> > From b51714389dea766a49118187c5954b7ccaf92587 Mon Sep 17 00:00:00
> > 2001
> > From: SATOH Fumiyasu <fumiyas@osstech.co.jp>
> > Date: Tue, 10 Nov 2020 17:15:42 +0900
> > Subject: [PATCH] autobuild: Encode text/plain into base64 to wrap
> > long-lines
> > 
> > MIMEText(text, 'plain', 'utf-8') encodes the text into
> > base64 and adds 'Content-Transfer-Encoding: base64' header.
> > ---
> >  script/autobuild.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/script/autobuild.py b/script/autobuild.py
> > index 24baa0fa9f2..a76309df8a2 100755
> > --- a/script/autobuild.py
> > +++ b/script/autobuild.py
> > @@ -1112,7 +1112,7 @@ def send_email(subject, text, log_tar):
> >      outer['From'] = options.email_from
> >      outer['Date'] = email.utils.formatdate(localtime=True)
> >      outer.preamble = 'Autobuild mails are now in MIME because we
> > optionally attach the logs.\n'
> > -    outer.attach(MIMEText(text, 'plain'))
> > +    outer.attach(MIMEText(text, 'plain', 'utf-8'))
> >      if options.attach_logs:
> >          with open(log_tar, 'rb') as fp:
> >              msg = MIMEApplication(fp.read(), 'gzip',
> > email.encoders.encode_base64)
> > -- 
> > 2.29.1
> > 
> > On Tue, 10 Nov 2020 15:51:47 +0900,
> > samba-technical@lists.samba.org wrote:
> > > When your autobuild is eaten, remember to check autobuild.log.
> > > 
> > > I didn't get an autobuild failure mail because that comes from
> > > the
> > > autobuild script, which failed to fire out the mail:
> > > 
> > > Traceback (most recent call last):
> > >   File "script/autobuild.py", line 1324, in <module>
> > >     elapsed_time, log_base=options.log_base)
> > >   File "script/autobuild.py", line 1197, in email_failure
> > >     text, logs)
> > >   File "script/autobuild.py", line 1130, in send_email
> > >     s.sendmail(options.email_from, [options.email], content)
> > >   File "/usr/lib/python3.6/smtplib.py", line 888, in sendmail
> > >     raise SMTPDataError(code, resp)
> > > smtplib.SMTPDataError: (550, b'maximum allowed line length is 998
> > > octets, got 1756')
> > > 
> > > This is because of this lovely line, which it wanted to put into
> > > the mail as context for the failure:
> > > test: running (/usr/bin/perl /m/abartlet/aMASTER/b2752753/samba-
> > > o3/selftest/selftest.pl --target=samba --prefix=./bin/ab --
> > > srcdir=/m/abartlet/aMASTER/b2752753/samba-o3 --
> > > exclude=/m/abartlet/aMASTER/b2752753/samba-o3/selftest/skip --
> > > testlist="/usr/bin/python3 /m/abartlet/aMASTER/b2752753/samba-
> > > o3/selftest/tests.py|" --testlist="/usr/bin/python3
> > > /m/abartlet/aMASTER/b2752753/samba-o3/source3/selftest/tests.py|" 
> > > --testlist="/usr/bin/python3 /m/abartlet/aMASTER/b2752753/samba-
> > > o3/source4/selftest/tests.py|"  
> > > --exclude=/m/abartlet/aMASTER/b2752753/samba-o3/selftest/slow --
> > > nss_wrapper_so_path=/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/nss_wrapper/libnss-wrapper.so --
> > > resolv_wrapper_so_path=/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/resolv_wrapper/libresolv-wrapper.so --
> > > uid_wrapper_so_path=/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/uid_wrapper/libuid-wrapper.so --
> > > socket_wrapper_so_path=/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/defaul
>  t/third_party/socket_wrapper/libsocket-wrapper.so --socket-wrapper
> --exclude=selftest/slow-none --include-env=none && touch
> ./bin/ab/st_done) | /usr/bin/python3 -u
> /m/abartlet/aMASTER/b2752753/samba-o3/selftest/filter-subunit --
> expected-failures=/m/abartlet/aMASTER/b2752753/samba-
> o3/selftest/knownfail --expected-
> failures=/m/abartlet/aMASTER/b2752753/samba-o3/selftest/knownfail.d
> --flapping=/m/abartlet/aMASTER/b2752753/samba-o3/selftest/flapping --
> flapping=/m/abartlet/aMASTER/b2752753/samba-o3/selftest/flapping.d --
> fail-immediately --expected-
> failures=/m/abartlet/aMASTER/b2752753/samba-
> o3/selftest/knownfail_heimdal_kdc | tee ./bin/ab/subunit |
> /usr/bin/python3 -u /m/abartlet/aMASTER/b2752753/samba-
> o3/selftest/format-subunit --prefix=./bin/ab --immediate
> > > LD_PRELOAD=/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/nss_wrapper/libnss-
> > > wrapper.so:/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/resolv_wrapper/libresolv-
> > > wrapper.so:/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/socket_wrapper/libsocket-
> > > wrapper.so:/m/abartlet/aMASTER/b2752753/samba-
> > > o3/bin/default/third_party/uid_wrapper/libuid-wrapper.so
> > > 
> > > Just in the hope this helps someone else (or someone knows how to
> > > fix it).
> > 
> > -- 
> > -- Name: SATOH Fumiyasu @ OSS Technology Corp. (fumiyas @ osstech
> > co jp)
> > -- Business Home: https://www.OSSTech.co.jp/
> > -- GitHub Home: https://GitHub.com/fumiyas/
> > -- PGP Fingerprint: BBE1 A1C9 525A 292E 6729  CDEC ADC2 9DCA 5E1C
> > CBCA
> > 
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




