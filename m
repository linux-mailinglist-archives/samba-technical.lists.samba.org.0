Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B621628EB
	for <lists+samba-technical@lfdr.de>; Tue, 18 Feb 2020 15:55:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=szkGVNIFIu+xh/cJuCenb20qF2l7abTMGKkV6xdNhzc=; b=1UKbxxlbYT/0J2oAO/WysOy3F3
	yYWgh/l016hRTLDWe0knaJIS5rZK9xQJVZOPcowepwFZILSiML7xfMwpC8ZGK9uRyQ2fHZ94DvLpW
	W+LyJ7ODaW1b1faCCeYWtD0kefr4G1+SGes2ijitZUMUKxuVzlS6VsSlSYJLGQ2Y/98IwLDmcCnVC
	f3RR+2vsso3N+N0iTjFCKLMpp4RYhvlf0VZhVh1smDQrLXnDkBTwRde6ECY/Jww/Yugdm48hBVJ0n
	mSBThnecdjUXcvujUXRO9cxbIuWCftNPM0RKsCnR2gc8gE5E2sdj6a6xNPF/lWK89S/7Cywcu9okB
	MJhx+E/w==;
Received: from localhost ([::1]:54844 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1j44Gs-00ANp8-P0; Tue, 18 Feb 2020 14:54:46 +0000
Received: from a2-26.smtp-out.eu-west-1.amazonses.com ([54.240.2.26]:44436) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim) id 1j44Gm-00ANp0-8w
 for samba-technical@lists.samba.org; Tue, 18 Feb 2020 14:54:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=gtiefq4aqa7w67wwqysvtccq4xrjnbj5; d=aaton.com; t=1582036555;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id;
 bh=szkGVNIFIu+xh/cJuCenb20qF2l7abTMGKkV6xdNhzc=;
 b=X4GydyvEwjMESFXar1OieRgSyFZA4aVM/cP71Iv2V2jaKrFKAaAPJbUcYsDObQJu
 hzcd2/Cisf0JFzeAM9q7gCcFUE3BrCG+WPzzdJsiggYxaHGnLS1eChpQwmA8Pyz82sz
 djxbtmh7yJzE52zJLKhrc2Zl6ARvjcKUAum1W5go=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
 s=ihchhvubuqgjsxyuhssfvqohv7z3u4hn; d=amazonses.com; t=1582036555;
 h=Subject:From:To:Date:Mime-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:References:Message-Id:Feedback-ID;
 bh=szkGVNIFIu+xh/cJuCenb20qF2l7abTMGKkV6xdNhzc=;
 b=cY0tf9BdoEZZ9BJCvX49rC3AkSE3+VwDQZ0Pv5zmbLjLjmeXs34NwjCNJE6BOJEr
 Yldsj9WUjOUBcQQ5vVgojmC3KcoT2a2MGEJKLWCAt2K5E0fGbsO/NsbH014bWKTTE4F
 9EKz010PxqUedDe/KoBiOS5W2SjnIJd/77ZzwbrU=
Subject: Re: QNX6.6 cross-compilation problem
To: =?UTF-8?Q?samba-technical=40lists=2Esamba=2Eorg?=
 <samba-technical@lists.samba.org>
Date: Tue, 18 Feb 2020 14:35:55 +0000
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org>
References: <7e220de2-1a52-02a8-ba8e-2fc963fa7699@aaton.com> 
 <116a320e-62d5-b51e-0b0d-7c0709237d0c@samba.org> 
 <51f6d175-d856-0d59-a19b-ee326066fae5@aaton.com> 
 <0102017053b6e994-c1f3f196-af94-47c2-914e-427291dbc480-000000@eu-west-1.amazonses.com>
 <0bfee16342064a00ce1b69edc9a1560f4f23e16e.camel@samba.org> 
 <1bce721f-c5d6-ab32-1e5a-167741775092@aaton.com>
X-Mailer: Amazon WorkMail
Thread-Index: AQHV4xePtgTlttjWR2av2pbvb72egAAVIUorAKNXpGIAp1Jp9QDUSp1p
Thread-Topic: QNX6.6 cross-compilation problem
Message-ID: <0102017058ba17bb-c855beaf-ff0f-4652-9716-c1c5c6995aa9-000000@eu-west-1.amazonses.com>
X-SES-Outgoing: 2020.02.18-54.240.2.26
Feedback-ID: 1.eu-west-1.b24dn6frgCi6dh20skzbuMRr7UL8M6Soir/3ogtEjHQ=:AmazonSES
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
From: Nicolas Pinault via samba-technical <samba-technical@lists.samba.org>
Reply-To: =?UTF-8?Q?Nicolas_Pinault?= <nicolasp@aaton.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Andrew,=0D=0A=0D=0ALe 17/02/2020 =C3=A0 18:08, Andrew Bartlett via samba-=
technical a =C3=A9crit=C2=A0:=0D=0A> On Mon, 2020-02-17 at 15:14 +0000, N=
icolas Pinault via samba-technical=0D=0A> wrote:=0D=0A>> Hi Uri,=0D=0A>>=0D=
=0A>> I'm using Ubuntu 18.04.4 LTS (32-bit).=0D=0A>> I use vanilla Samba =
sources (4.11.6) downloaded directly from Samba WEB=0D=0A>> site. No patc=
h applied.=0D=0A>>=0D=0A>> Looks like asn1_compile is a target executable=
, not a host executable.=0D=0A>> Do I have to run waf with special option=
s when cross-compiling =3F=0D=0A> This is a known issue:=0D=0A>=0D=0A> Th=
ere is a workaround patch here, but do read my followup there for why=0D=0A=
> it isn't my preference and so why this isn't merged yet.=0D=0A> https:/=
/lists.samba.org/archive/samba-technical/2019-October/134438.html=0D=0A>=0D=
=0A> The patch is here:=0D=0A> https://attachments.samba.org/attachment.c=
gi=3Fid=3D15558=0D=0A>=0D=0A> I hope this helps,=0D=0AThanks for the patc=
h and the detailed explanations.=0D=0A=0D=0AAfter applying the patch and =
re-running configuration, waf goes much=20=0D=0Afurther in the compilatio=
n process.=0D=0AThe error I get now is :=0D=0A[ 552/3064] Linking bin/def=
ault/libcli/util/libsamba-errors.so=0D=0A15:23:42 runner ['ntoarmv7-gcc',=
 '-shared',=20=0D=0A'-Wl,-h,libsamba-errors.so.1', 'libcli/util/doserr.c.=
1.o',=20=0D=0A'libcli/util/errormap.c.1.o', 'libcli/util/nterr.c.1.o',=20=
=0D=0A'libcli/util/errmap_unix.c.1.o', 'libcli/util/hresult.c.1.o', '-o',=
=20=0D=0A'/home/nicolas/samba/samba-4.11.6/bin/default/libcli/util/libsam=
ba-errors.so',=20=0D=0A'-Wl,-Bstatic', '-Wl,-Bdynamic',=20=0D=0A'-L/home/=
nicolas/samba/samba-4.11.6/bin/default/lib/replace',=20=0D=0A'-L/home/nic=
olas/samba/samba-4.11.6/bin/default/lib/talloc',=20=0D=0A'-L/home/nicolas=
/samba/samba-4.11.6/bin/default/lib/util',=20=0D=0A'-L/usr/local/lib', '-=
L/usr/local/lib', '-lsamba-debug-samba4',=20=0D=0A'-ltalloc', '-ltime-bas=
ic-samba4', '-lreplace-samba4',=20=0D=0A'-lsocket-blocking-samba4', '-lso=
cket', '-lgnutls', '-Wl,-no-undefined',=20=0D=0A'-Wl,--export-dynamic', '=
-Wl,--as-needed']=0D=0A/home/nicolas/qnx660/host/linux/x86/usr/bin/arm-un=
known-nto-qnx6.6.0eabi-ld:=20=0D=0Acannot find -lgnutls=0D=0A=0D=0AIt loo=
ks like I have to cross-compile gnutls for my system. Right =3F=0D=0A=0D=0A=
Regards,=0D=0ANicolas=0D=0A=0D=0A>=0D=0A> Andrew Bartlett=0D=0A>=0D=0A=0D=
=0A

