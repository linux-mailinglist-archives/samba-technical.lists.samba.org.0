Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EB66E1580
	for <lists+samba-technical@lfdr.de>; Thu, 13 Apr 2023 21:56:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=rZcDg3ZBOzYIW+1/Xnj+vOzTAoTLZL2AXWd2cK6C+i0=; b=3mHsaE2rOmsg2JXB8sxafI6Awh
	nPAS/dH32xEIkxtaOUNHWDfPHcIL+/Iax609VjBP1hknj7YPZ0dYxAYxeKlX+MM3LbQXw5+/DHr0Z
	5qSh0jNfCZW5HVrvhwj3h/n1Ixwah/HATqsCsnM/PagwWEfNETUF2tSo3Beos1y6muntAgjEBbFN5
	TNn3ADHv7vgpQhNcvmdxIrbCMI1GsKNJe+frDfVoKX+Qr0SdrpQI94EAm3jf5uJKnOKvPdXFZGYtA
	T6dAVHnURBN0DHOX7BGresBtVtBALfalcsjikqoBMHWH6GOgyS0xoFjkRE8Lj7vtfX6zlIsHbBs53
	XWiJ7/Hw==;
Received: from ip6-localhost ([::1]:23104 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pn33S-001GUB-SY; Thu, 13 Apr 2023 19:56:26 +0000
Received: from isrv.corpit.ru ([86.62.121.231]:57421) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pn33O-001GU2-La
 for samba-technical@lists.samba.org; Thu, 13 Apr 2023 19:56:24 +0000
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 61E4C40126;
 Thu, 13 Apr 2023 22:56:20 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id EA98D95;
 Thu, 13 Apr 2023 22:56:18 +0300 (MSK)
Message-ID: <8557dd80-7d04-f24a-69bb-d1669c47eeb0@msgid.tls.msk.ru>
Date: Thu, 13 Apr 2023 22:56:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: smbd tries to read ~root/* files
Content-Language: en-US
To: Ralph Boehme <slow@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
References: <0be5f27e-1b25-b756-66c1-9e5034920e7f@msgid.tls.msk.ru>
 <45a21c30-3f90-4fa5-f427-b5d3afc6dd68@samba.org>
In-Reply-To: <45a21c30-3f90-4fa5-f427-b5d3afc6dd68@samba.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
From: Michael Tokarev via samba-technical <samba-technical@lists.samba.org>
Reply-To: Michael Tokarev <mjt@tls.msk.ru>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

13.04.2023 22:37, Ralph Boehme via samba-technical wrote:
> On 4/13/23 20:56, Michael Tokarev via samba-technical wrote:
>> This might be, at the very least, quite unexpected, - once
>> there's something in root's configs, samba will do stuff not
>> configured in smb.conf?
> 
> ECANTREPRODUCE
> 
> I start Samba, connect with smbclient, get the pid of the smbd session process with smbstatus and then run strace -v -p PID on that pid for a few 
> seconds.

I'm sorry for not providing the details initially.  I was busy
with another prob, all these observations (and many more) come
by the way there.

It is samba 4.17.7 (4.17.7-1~bpo11-1 debian package), configured
as a domain member (with the same version of samba acting as a
domain controller).  The client is a windows10 machine.  I don't
know if kerberos-related stuff is used without the domain part
(and this looks like kerberos stuff).

I can't say *when* exactly this file access happens, - since I
traced something else, and this was just background noise.  Here's
an example of the command received from the client:

recvmsg(33, {msg_name=NULL, msg_namelen=0, msg_iov=[{iov_base="\0\0\7*", iov_len=4}], msg_iovlen=1, msg_controllen=0, msg_flags=0}, 0) = 4
recvmsg(33, {msg_name=NULL, msg_namelen=0, 
msg_iov=[{iov_base="\376SMB@\0\1\0\1\0\0\0\1\0\0\0\20\0\0\0\0\0\0\0N\224\2\0\0\0\0\0\377\376\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0
\0\0\0\0\0\0\0\0\0\0\31\0\0\1\1\0\0\0\0\0\0\0X\0\322\6\0\0\0\0\0\0\0\0`\202\6\316\6\6+\6\1\5\5\2\240\202\6\3020\202\6\276\24000.\6\t*\206H\202\367\22\1\2\2\6\t*\206H\206\367\2
2\1\2\2\6\n+\6\1\4\1\2027\2\2\36\6\n+\6\1\4\1\2027\2\2\n\242\202\6\210\4\202\6\204`\202\6\200\6\t*\206H\206\367\22\1\2\2\1\0n\202\6o0\202\6k\240\3\2\1\5\241\3\2\1\16\242\7\3\5
\0 \0\0\0\243\202\4\306a\202\4\3020\202\4\276\240\3\2\1\5\241\f\33\nTLS.MSK.RU\242\0270\25\240\3\2\1\2\241\0160\f\33\4"..., iov_len=1834}], 
msg_iovlen=1, msg_controllen=0, msg
_flags=0}, 0) = 1834

after which it becomes root and tries to open /root/.foo files.

There are other similar cases, always starting with similar
recvmsg.  I can provide more complete traces if needed.

> Please post your smb.conf and explain in a bit more detail how you're connecting and what your tracing.

Here's the smb.conf (as-is):

[global]
  server string = %h samba server %v
  netbios name = TSRV
  realm = TLS.MSK.RU
  workgroup = TLS
  server role = member server
  security = ADS

  idmap config TLS : backend = ad
  idmap config TLS : range = 1000-4999
  idmap config TLS : schema_mode = rfc2307
  idmap config TLS : unix_primary_group = yes
  template homedir = /home/%U
  template shell = /bin/bash
  idmap config * : backend = tdb
  idmap config * : range = 5000-5099
  winbind use default domain = yes

  kerberos method = secrets and keytab
  dedicated keytab file = /etc/krb5.keytab

  allow hosts = 192.168.177.0/26 192.168.19.16/30 127.0.0.0/8

  log file = /var/log/samba/log.%m
  max log size = 1000
  log level = 1
  logging = file

  # disable user shares (fix debian defaults idiocy)
  usershare max shares = 0

  load printers = no
  printing = bsd
  disable spoolss = yes

  map hidden = yes
  create mask = 0775
  directory mask = 0775
  acl allow execute always = true

  # unix ext and wide links are incompatible. we need wide links.
  unix extensions = no
  wide links = yes

[homes]
  comment = Home Directories
  browseable = no
  writable = yes

[ws]
  comment = TLS Workspace
  path = /ws/ws
  writable = yes

> Btw, there's also security@samba.org the next time you run into such a nice one... :)

I thought about using security@, but discarded this idea in this case,
it haven't looked like a security issue. But now after thinking a bit
more, it well might be, and needs at least some investigation.

Thanks,

/mjt

