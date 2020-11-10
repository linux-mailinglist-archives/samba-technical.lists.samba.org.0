Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 2177F2AD006
	for <lists+samba-technical@lfdr.de>; Tue, 10 Nov 2020 07:53:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=t5a6WPt0GdlKKg5pg4tZdqmTZvDGFmi9ys2qu7ysi3U=; b=sAcTrh6oBZ8cuL8zcag+iyEbTL
	FB75no9ujumqyBiEwk+26qs/WwZWKYGRSZaFV2Ich9fl3zo38W0NHPOFcxKEHNGHId8ox4aJTuRmb
	/5JNLhpfWP5Ts7xbKxn6hlMpVjFcuAG6brREKInJ45O7kpHsySuZb4tHybqzw/im1VKQtDvKdmFMZ
	7100TTWl01u7GToMoezhevrmoQ+L+WFB0u1spHIhFDaRWQC/XsY2ALtR1oDAEB7WQ9ZfyA1T2/DJy
	1kh+LZ7BmbkxUfki8ZF/I3syOjebfpvwWiZSVBNFeJemfoqGNL0UeftjjZKKYbvMGXEW3gLxLJE8w
	1Wyuk6DQ==;
Received: from ip6-localhost ([::1]:63200 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kcNVk-000cEE-EX; Tue, 10 Nov 2020 06:52:12 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:13716) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcNVR-000cE7-JK
 for samba-technical@lists.samba.org; Tue, 10 Nov 2020 06:51:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=t5a6WPt0GdlKKg5pg4tZdqmTZvDGFmi9ys2qu7ysi3U=; b=w1zCpdtpZCbX7NeDF+p0b89hgc
 7yGNNgnSN6UJ0API4d5XjY4bJSYQtgz5ZacHOo5VJKRtf4YIUul7sJuyc8WxXTeFsmLUcONgTNCaU
 OtrCTMD5nfvUU8PEmaX32NOdvtSwZnjD2JE/reqJ7FUasEKxSHzwAjiVO+QknCAtRwARZ4kQBiZyf
 GXDlaJbAp+XbNbInwdS6hSF9dxB/oOyfqLPwOMgA3qjQGmlQ3Fi7CrIaczvcbgAqtZiTELfMtQOHN
 MWjXb9oAFUai3kruZl6vwGnwSvlGmsa0Bs9XjJMlEydfnIoVyJf+dLZQmtwWyy9oXfKf/3LX5Wh1J
 Pfh58V3XsXHES115NRIVY7jIMiBsEacGxRAAfAxsN+Z1GC9xnpGg769p+gwR7pLGllAnTU4ZrCcx2
 G8eMMV0Y+ytdvXsUkGa4dCT+mMkxhB8w6ZRuOPuWTDrKad5m4XE0EVjqhu8bsVnnjkDJM4fmNnpQL
 hL5a6gk9/excrfdsyy8cOkc9;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kcNVP-0001sp-Ml
 for samba-technical@lists.samba.org; Tue, 10 Nov 2020 06:51:52 +0000
Message-ID: <b70db8da503720b24dbadcba32d95556c108d01a.camel@samba.org>
Subject: Eaten by autobuild?
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Tue, 10 Nov 2020 19:51:47 +1300
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

When your autobuild is eaten, remember to check autobuild.log.

I didn't get an autobuild failure mail because that comes from the
autobuild script, which failed to fire out the mail:

Traceback (most recent call last):
  File "script/autobuild.py", line 1324, in <module>
    elapsed_time, log_base=3Doptions.log_base)
  File "script/autobuild.py", line 1197, in email_failure
    text, logs)
  File "script/autobuild.py", line 1130, in send_email
    s.sendmail(options.email_from, [options.email], content)
  File "/usr/lib/python3.6/smtplib.py", line 888, in sendmail
    raise SMTPDataError(code, resp)
smtplib.SMTPDataError: (550, b'maximum allowed line length is 998
octets, got 1756')

This is because of this lovely line, which it wanted to put into the mail a=
s context for the failure:
test: running (/usr/bin/perl /m/abartlet/aMASTER/b2752753/samba-o3/selftest=
/selftest.pl --target=3Dsamba --prefix=3D./bin/ab --srcdir=3D/m/abartlet/aM=
ASTER/b2752753/samba-o3 --exclude=3D/m/abartlet/aMASTER/b2752753/samba-o3/s=
elftest/skip --testlist=3D"/usr/bin/python3 /m/abartlet/aMASTER/b2752753/sa=
mba-o3/selftest/tests.py|" --testlist=3D"/usr/bin/python3 /m/abartlet/aMAST=
ER/b2752753/samba-o3/source3/selftest/tests.py|" --testlist=3D"/usr/bin/pyt=
hon3 /m/abartlet/aMASTER/b2752753/samba-o3/source4/selftest/tests.py|"  --e=
xclude=3D/m/abartlet/aMASTER/b2752753/samba-o3/selftest/slow --nss_wrapper_=
so_path=3D/m/abartlet/aMASTER/b2752753/samba-o3/bin/default/third_party/nss=
_wrapper/libnss-wrapper.so --resolv_wrapper_so_path=3D/m/abartlet/aMASTER/b=
2752753/samba-o3/bin/default/third_party/resolv_wrapper/libresolv-wrapper.s=
o --uid_wrapper_so_path=3D/m/abartlet/aMASTER/b2752753/samba-o3/bin/default=
/third_party/uid_wrapper/libuid-wrapper.so --socket_wrapper_so_path=3D/m/ab=
artlet/aMASTER/b2752753/samba-o3/bin/default/third_party/socket_wrapper/lib=
socket-wrapper.so --socket-wrapper --exclude=3Dselftest/slow-none --include=
-env=3Dnone && touch ./bin/ab/st_done) | /usr/bin/python3 -u /m/abartlet/aM=
ASTER/b2752753/samba-o3/selftest/filter-subunit --expected-failures=3D/m/ab=
artlet/aMASTER/b2752753/samba-o3/selftest/knownfail --expected-failures=3D/=
m/abartlet/aMASTER/b2752753/samba-o3/selftest/knownfail.d --flapping=3D/m/a=
bartlet/aMASTER/b2752753/samba-o3/selftest/flapping --flapping=3D/m/abartle=
t/aMASTER/b2752753/samba-o3/selftest/flapping.d --fail-immediately --expect=
ed-failures=3D/m/abartlet/aMASTER/b2752753/samba-o3/selftest/knownfail_heim=
dal_kdc | tee ./bin/ab/subunit | /usr/bin/python3 -u /m/abartlet/aMASTER/b2=
752753/samba-o3/selftest/format-subunit --prefix=3D./bin/ab --immediate
LD_PRELOAD=3D/m/abartlet/aMASTER/b2752753/samba-o3/bin/default/third_party/=
nss_wrapper/libnss-wrapper.so:/m/abartlet/aMASTER/b2752753/samba-o3/bin/def=
ault/third_party/resolv_wrapper/libresolv-wrapper.so:/m/abartlet/aMASTER/b2=
752753/samba-o3/bin/default/third_party/socket_wrapper/libsocket-wrapper.so=
:/m/abartlet/aMASTER/b2752753/samba-o3/bin/default/third_party/uid_wrapper/=
libuid-wrapper.so

Just in the hope this helps someone else (or someone knows how to fix it).

Andrew Bartlett

--=20
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT         =20
https://catalyst.net.nz/services/samba




